# Airbnb Database ER Diagram Requirements

## Entities and Attributes

### User
- **user_id** : Primary Key, UUID, Indexed
- **first_name** : VARCHAR, NOT NULL
- **last_name** : VARCHAR, NOT NULL
- **email** : VARCHAR, UNIQUE, NOT NULL
- **password_hash** : VARCHAR, NOT NULL
- **phone_number** : VARCHAR, optional
- role : ENUM `'guest', 'host', 'admin`', NOT NULL
- created_at : TIMESTAMP, default: `CURRENT_TIMESTAMP`

### Property
- **property_id** : Primary Key, UUID, Indexed
- **host_id** : UUID, Foreign Key → User.user_id
- **name** : VARCHAR, NOT NULL
- **description** : TEXT, NOT NULL
- **location** : VARCHAR, NOT NULL
- **price_per_night** : DECIMAL, NOT NULL
- **created_at** : TIMESTAMP, default: `CURRENT_TIMESTAMP`
- **updated_at** :  TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- **booking_id** : Primary Key, UUID, Indexed  
- **property_id** : Foreign Key → Property(property_id)  
- **user_id** : Foreign Key → User(user_id)  
- **start_date** : DATE, NOT NULL  
- **end_date** : DATE, NOT NULL  
- **total_price** : DECIMAL, NOT NULL  
- **status** : ENUM `'pending', 'confirmed', 'cancelled'`, NOT NULL  
- **created_at** : TIMESTAMP, default: `CURRENT_TIMESTAMP`  

### Payment
- **payment_id** : Primary Key, UUID, Indexed  
- **booking_id** : Foreign Key → Booking(booking_id)  
- **amount** : DECIMAL, NOT NULL  
- **payment_method** : ENUM `'credit_card', 'paypal', 'stripe'`, NOT NULL  
- **payment_date** : TIMESTAMP, default: `CURRENT_TIMESTAMP`


### Review
- **review_id** : Primary Key, UUID, Indexed  
- **property_id** : Foreign Key → Property(property_id)  
- **user_id** : Foreign Key → User(user_id)  
- **rating** : INTEGER, NOT NULL, CHECK `1 <= rating <= 5`  
- **comment** : TEXT, NOT NULL  
- **created_at** : TIMESTAMP, default: `CURRENT_TIMESTAMP` 


## Constraints

### User Table

- Unique constraint on `email`.
- Non-null constraints on required fields.

### Property Table

- Foreign key constraint on `host_id`.
- Non-null constraints on essential attributes.

### Booking Table

- Foreign key constraints on `property_id` and `user_id`.
- status must be one of `pending`, `confirmed`, or `canceled`.

### Payment Table

- Foreign key constraint on `booking_id`, ensuring payment is linked to valid bookings.

### Review Table

- Constraints on `rating` values (1-5).
- Foreign key constraints on `property_id` and `user_id`.
Message Table
Foreign key constraints on `sender_id` and `recipient_id`.


## Indexing

- **Primary Keys** : Indexed automatically.
- **Additional Indexes** :
     -- `email` in the **User** table.
     -- `property_id` in the **Property** and **Booking** tables.
    -- `booking_id` in the **Booking** and **Payment** tables.
