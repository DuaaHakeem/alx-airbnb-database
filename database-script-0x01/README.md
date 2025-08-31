# Airbnb Database Schema

This project defines the normalized database schema for an Airbnb database design.  
The schema was refined through the process of **database normalization** (1NF → 2NF → 3NF).  

The final schema ensures:
- No redundant data
- Elimination of update anomalies
- Efficient query performance
- Proper relationships between entities


### The database consists of the following main entities:

1. **User** – stores user details  
2. **Property** – stores property details listed on Airbnb  
3. **Booking** – stores booking information made by users for properties  
4. **Payment** – stores payment details for each booking  
5. **Review** – stores reviews and ratings left by users on properties
6. **Message** - stores messages exchanged between users

## 🛠️ SQL Schema (schema.sql)

The `schema.sql` file contains `CREATE TABLE` statements to define the database schema.  

### Entities & Relationships


`User` ───< Property >─── Booking 
  │                     │
  │                     └───< Review >─── `User`
  └───< Payment

### Constraints
- **Primary Keys** – uniquely identify each record  
- **Foreign Keys** – establish relationships between tables  
- **Not Null** – enforce mandatory fields  
- **Unique Constraints** – avoid duplicate values (e.g., unique email for users)  


## Indexing

To improve query performance:
- Indexed `User.email`
- Indexed `Booking.property_id` and `Property.property_id`
- Indexed `Booking.booking_id` and `Payment.booking_id`

