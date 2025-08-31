# Airbnb Database Seed Script

This file (`seed.sql`) provides sample data to populate the **Airbnb database schema**. It is designed to illustrate how the database tables interact with each other and to provide realistic mock data for testing and development purposes.  

The script covers all major entities in the system, including users, properties, bookings, reviews, messages, roles, locations, and payments. By running this script, developers can quickly set up a functional database environment for experimentation, prototyping, and demonstration.  

---

## Contents of `seed.sql`

The script inserts records into the following tables:

- **User**  
  Includes sample users with email, name, password, role, and `created_at` timestamp.  

- **Property**  
  Populates sample property listings with details such as title, description, price per night, location, host user, `created_at`, and `updated_at` timestamps.  

- **Booking**  
  Provides realistic booking records that reference users and properties, with start and end dates, status, and `created_at` timestamp.  

- **Review**  
  Adds user reviews with ratings, comments, and `created_at` timestamp.  

- **Message**  
  Demonstrates user-to-user messaging related to bookings, including sender, receiver, booking reference, and message timestamp.  

- **User Role**  
  Defines roles such as *guest* and *host*.  

- **Property Location**  
  Populates location details (city, country) for properties.  


---

## Key Notes

- **Timestamps**  
  - `created_at` is included in most entities and uses realistic ISO 8601 timestamp values (e.g., `2025-08-31 10:00:00`).  
  - `updated_at` is also included for properties to simulate changes after creation.  

- **Passwords**  
  For demonstration purposes, user passwords are stored in plain text in this sample dataset.  
  ⚠️ **In a real-world system, passwords must always be securely hashed (for example using bcrypt).**

- **IDs**  
  IDs is follow the standred UUID.

- **Sample Nature**  
  This dataset is **only for testing and learning purposes**. It is not intended for production use.  

---

## Usage

1. Ensure you have already created the database schema using `schema.sql`.  
2. Run the following command to seed the database with sample data:  
