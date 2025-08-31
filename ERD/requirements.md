# Airbnb Database ER Diagram Requirements

## 1. Entities and Attributes

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
