
INSERT INTO User_Role (role_id, role_name)
VALUES 
    (1, 'Guest'),
    (2, 'Host'),
    (3, 'Admin');

INSERT INTO User (user_id, role_id, first_name, last_name, email, password, phone, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440000', 1, 'Alice', 'Johnson', 'alice@example.com','password123', '+201000000001', '2025-01-10 09:15:00'),
    ('550e8400-e29b-41d4-a716-446655440001', 2, 'Bob', 'Smith', 'bob@example.com', 'securePass456', '+201000000002', '2025-01-12 11:25:00'),
    ('550e8400-e29b-41d4-a716-446655440002', 1, 'Charlie', 'Brown', 'charlie@example.com','mySecret789', '+201000000003', '2025-01-15 14:45:00'),
    ('550e8400-e29b-41d4-a716-446655440003', 2, 'Diana', 'Prince', 'diana@example.com', '+201000000004', '2025-01-22 4:32:00');


INSERT INTO Property_Location (location_id, address, city, country)
VALUES
    ('550e8400-e29b-41d4-a716-446655440100', '123 Nile St', 'Cairo', 'Egypt'),
    ('550e8400-e29b-41d4-a716-446655440101', '45 King Road', 'Alexandria', 'Egypt'),
    ('550e8400-e29b-41d4-a716-446655440102', '78 shehab st', 'Rehab', 'Egypt');

INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night, created_at, updated_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440200', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440100', 'Cozy Cairo Apartment', 'A beautiful apartment near the Nile.', 50.00, '2025-02-01 10:30:00', '2025-02-01 08:30:00'),
    ('550e8400-e29b-41d4-a716-446655440201', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440101', 'London Studio Flat', 'Modern studio in central London.', 120.00, '2025-02-05 16:20:00', '2025-02-06 09:15:00'),
    ('550e8400-e29b-41d4-a716-446655440202', '550e8400-e29b-41d4-a716-4466554400022', '550e8400-e29b-41d4-a716-446655440102', 'LA Beach House', 'Luxury house near the beach.', 300.00, '2025-02-07 18:50:00', '2025-02-10 05:10:00');


INSERT INTO Payment_Method (method_id, method_name)
VALUES
    (1, 'Credit Card'),
    (2, 'PayPal'),
    (3, 'stripe');
  
  
  INSERT INTO Payment (payment_id, booking_id, amount, method_id, payment_date)
VALUES
    ('550e8400-e29b-41d4-a716-446655440400', '550e8400-e29b-41d4-a716-446655440300', 250.00, 1, '2025-09-01'),
    ('550e8400-e29b-41d4-a716-446655440401', '550e8400-e29b-41d4-a716-446655440301', 600.00, 2, '2025-09-15'),
    ('550e8400-e29b-41d4-a716-446655440402', '550e8400-e29b-41d4-a716-446655440302', 2100.00, 1, '2025-09-20');


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440300', 'p1', 'u1', '2025-09-10', '2025-09-15', '2025-02-10 12:40:00'),
    ('550e8400-e29b-41d4-a716-446655440301', 'p2', 'u3', '2025-09-20', '2025-09-25', '2025-02-15 09:10:00'),
    ('550e8400-e29b-41d4-a716-446655440302', 'p3', 'u1', '2025-10-01', '2025-10-07', '2025-02-20 19:30:00');


INSERT INTO Review (review_id, booking_id, user_id, rating, comment, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440500', '550e8400-e29b-41d4-a716-446655440300', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing stay, super clean and cozy!','2025-03-08 08:30:00'),
    ('550e8400-e29b-41d4-a716-446655440501', '550e8400-e29b-41d4-a716-446655440302', '550e8400-e29b-41d4-a716-446655440003', 4, 'Great location, but a bit noisy.', '2025-04-16 11:45:00'),
    ('550e8400-e29b-41d4-a716-446655440502', '550e8400-e29b-41d4-a716-446655440303', '550e8400-e29b-41d4-a716-446655440001', 5, 'Loved the beach house, perfect vacation!', '2025-05-26 10:15:00');

INSERT INTO Message (message_id, sender_id, receiver_id, booking_id, message_text, sent_at)
VALUES
  ('550e8400-e29b-41d4-a716-446655440600', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440300', 'Hi, I am looking forward to my stay!', '2025-05-15 10:30:00'),
  ('550e8400-e29b-41d4-a716-446655440601', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440300', 'Welcome! I’ll prepare everything.', '2025-05-15 11:00:00');



  

