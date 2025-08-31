# Database Normalization

This document explains the normalization process applied to the **Airbnb database design**.  
From **First Normal Form (1NF)** to **Third Normal Form (3NF)**, ensuring the database is clean, consistent, and free from anomalies.

---

## 1️⃣ First Normal Form (1NF)

### Issues Found and Fixes
- **`location` in `Property`**:  
  Originally stored as a single `VARCHAR`.  
  -  Non-atomic (contains multiple pieces of information: street, city, country).  
  - ✅ Fix: split into atomic fields (`address_line`, `city`, `region`, `country`, `postal_code`).

✅ After this adjustment, the database satisfies **1NF**.

---

## 2️⃣ Second Normal Form (2NF)


### Findings
- In our schema, most tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) use **single-column primary keys** (`UUID`).  
  - ✅ No risk of partial dependency → they are automatically in **2NF**.

✅ Current schema satisfies **2NF**.

---

## 3️⃣ Third Normal Form (3NF)

### Issues Found and Fixes
- **`Property` location details**:  
  `city → region → country` is a transitive dependency.  
  - ✅ Fix: create a separate `Location` table and reference it from `Property`.

- **`Payment` method**:  
  `payment_method` was an ENUM. If we need metadata (like transaction fees), that introduces dependency issues.  
  - ✅ Fix: create a `Payment_Method` lookup table.

- **`User` role**:  
  For flexibility, roles can be stored in a separate `Role` table instead of an ENUM.  

### Final 3NF Schema Overview
- **User(user_id, first_name, last_name, email, password_hash, phone_number, role_id, created_at)**  
- **Role(role_id, role_name)**  
- **Property(property_id, host_id, location_id, address_line, name, description, price_per_night, created_at, updated_at)**  
- **Location(location_id, city, region, country, postal_code)**  
- **Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)**  
- **Payment(payment_id, booking_id, method_id, amount, payment_date)**  
- **Payment_Method(method_id, method_name)**  
- **Review(review_id, property_id, user_id, rating, comment, created_at)**  
- **Message(message_id, sender_id, recipient_id, message_body, sent_at)**  

✅ Now the schema is in **Third Normal Form**.

---

- **3NF**: Removed transitive dependencies by introducing `Location`, `Payment_Method`, and optionally `Role`.

The database is now clean, extensible, and optimized for consistency and scalability.
