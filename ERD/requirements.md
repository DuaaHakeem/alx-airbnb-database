# Airbnb Database ER Diagram Requirements

## 1. Entities and Attributes

### User
- **user_id** : Primary Key, UUID, Indexed
- first_name : VARCHAR, NOT NULL
- last_name : VARCHAR, NOT NULL
- email : VARCHAR, UNIQUE, NOT NULL
- password_hash : VARCHAR,NOT NULL
- phone_number : VARCHAR, optional
- role :ENUM: 'guest', 'host', 'admin'
- created_at (TIMESTAMP, default: `CURRENT_TIMESTAMP`)

### Property
- **property_id** (Primary Key, UUID, Indexed)
- host_id (UUID, Foreign Key → User.user_id)
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- price_per_night (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, default: `CURRENT_TIMESTAMP`)
- updated_at (TIMESTAMP)

### Booking
- **booking_id** (Primary Key, UUID, Indexed)
- property_id (UUID, Foreign Key → Property.property_id)
- user_id (UUID, Foreign Key → User.user_id)
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (NOT NULL, ENUM: 'pending', 'confirmed', 'cancelled')
- created_at (TIMESTAMP,  default: `CURRENT_TIMESTAMP`)

### Payment
- **payment_id** (Primary Key, UUID, Indexed)
- booking_id (UUID, Foreign Key → Booking.booking_id)
- amount (DECIMAL, NOT NULL)
- payment_method (NOT NULL, ENUM: 'credit_card', 'paypal', 'stripe')
- payment_date (TIMESTAMP, default: `CURRENT_TIMESTAMP`)

### Review
- **review_id** (Primary Key, UUID, Indexed)
- property_id (UUID, Foreign Key → Property.property_id)
- user_id (UUID, Foreign Key → User.user_id)
- rating (INTEGER, NOT NULL, CHECK: `1 <= rating <= 5`)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, default: `CURRENT_TIMESTAMP`)

### Message
- **message_id**: Primary Key, UUID, Indexed  
- **sender_id**: Foreign Key → User(user_id)  
- **recipient_id**: Foreign Key → User(user_id)  
- **message_body**: TEXT, NOT NULL  
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
