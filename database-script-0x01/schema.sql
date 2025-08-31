

CREATE TABLE User_role (
    role_id      UUID PRIMARY KEY NOT NULL,
    role_name    VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE User (
    user_id         UUID PRIMARY KEY,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    phone_number    VARCHAR(20),
    password_hash   VARCHAR(255) NOT NULL,
    role_id        UUID NOT NULL REFERENCES User_role(role_id) ON DELETE RESTRICT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE INDEX idx_user_email ON User(email);


CREATE TABLE Property_location (
    location_id   UUID PRIMARY KEY NOT NULL,
    city          VARCHAR(100) NOT NULL,
    region        VARCHAR(100),
    country       VARCHAR(100) NOT NULL,
    postal_code   VARCHAR(20)
);


CREATE TABLE Property (
    property_id     UUID PRIMARY KEY,
    host_id         UUID NOT NULL,
    location_id     UUID NOT NULL,
    name            VARCHAR(150) NOT NULL,
    description     TEXT
    price_per_night DECIMAL(10,2) NOT NULL CHECK (price_per_night >= 0),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
    FOREIGN KEY (location_id) REFERENCES Property_location(locaion_id) ON DELETE CASCADE
);



CREATE TABLE Booking (
    booking_id      UUID PRIMARY KEY,
    property_id     UUID NOT NULL,
    user_id         UUID NOT NULL,
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL,
    total_price     DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    status          VARCHAR(20) NOT NULL CHECK (status IN ('pending','confirmed','canceled')),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_dates CHECK (end_date > start_date)
);

CREATE INDEX idx_booking ON Booking(booking_id);

CREATE TABLE payment_method (
    method_id    UUID PRIMARY KEY NOT NULL,
    method_name  VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Payment (
    payment_id      UUID PRIMARY KEY,
    booking_id      UUID NOT NULL,
    amount          DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method_id       UUID NOT NULL REFERENCES payment_method(method_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

CREATE INDEX idx_payment ON Payment(payment_id);


CREATE TABLE Review (
    review_id       UUID PRIMARY KEY,
    property_id     UUID NOT NULL,
    user_id         UUID NOT NULL,
    rating          INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_review ON Review(review_id);


CREATE TABLE Message (
    message_id      UUID PRIMARY KEY,
    sender_id       UUID NOT NULL,
    recipient_id    UUID NOT NULL,
    message_body    TEXT NOT NULL,
    sent_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES UserAccount(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES UserAccount(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_message_not_self CHECK (sender_id <> recipient_id)
);

CREATE INDEX idx_message ON Message(message_id);

