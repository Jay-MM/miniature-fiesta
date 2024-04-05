INSERT INTO inventory (item_name, quantity, unit_price) VALUES
('Soft Tortillas', 280, 1.50),
('Mashed Potatoes', 80, 2.99),
('Beans', 80, 3.50),
('Pressed Pork Rinds', 40, 4.99),
('Pork Rinds with Potatoes', 40, 0.75),
('Mexican Shredded Beef', 40, 1.50),
('Coca-Cola', 100, 1.25),
('Squirt', 50, 2.00);

INSERT INTO customers (name, contact_number, preferences) VALUES
('John Doe', '123-456-7890', 'None'),
('Jane Smith', '987-654-3210', 'Vegetarian');

INSERT INTO menu_items (name, description, price, category, quantity_available, inventory_id) VALUES
('Taco with Mashed Potatoes', 'Soft tortilla filled with mashed potatoes', 5.99, 'Taco', 0, 2),
('Taco with Beans', 'Soft tortilla filled with beans', 5.99, 'Taco', 0, 3),
('Taco with Pressed Pork Rinds', 'Soft tortilla filled with pressed pork rinds', 6.99, 'Taco', 0, 4),
('Taco with Pork Rinds and Potatoes', 'Soft tortilla filled with pork rinds and potatoes', 6.99, 'Taco', 0, 5),
('Taco with Mexican Shredded Beef', 'Soft tortilla filled with Mexican shredded beef', 7.99, 'Taco', 0, 6);

INSERT INTO orders (customer_id, description, price, status, order_time) VALUES
(1, 'Taco with Mashed Potatoes and Squirt', 8.99, 'Pending', '2024-04-04 12:00:00'),
(2, 'Taco with Beans and Coca-Cola', 8.99, 'Pending', '2024-04-04 13:30:00');

INSERT INTO order_items (order_id, menu_item_id, quantity, modifications) VALUES
(1, 1, 1, NULL),
(1, 7, 1, NULL),
(2, 2, 1, NULL),
(2, 8, 1, NULL);

INSERT INTO payment_processes (order_id, total_payment, status, timedate) VALUES
(1, 8.99, 'Completed', '2024-04-04 12:30:00'),
(2, 8.99, 'Pending', '2024-04-04 14:00:00');

INSERT INTO delivery (order_id, customer_id, timedate, status) VALUES
(1, 1, '2024-04-04 13:00:00', TRUE),
(2, 2, '2024-04-04 14:15:00', FALSE);

INSERT INTO pick_up (order_id, customer_id, timedate, status) VALUES
(1, 1, '2024-04-04 13:10:00', TRUE),
(2, 2, '2024-04-04 14:20:00', TRUE);

INSERT INTO employees (name, role, schedule, salary) VALUES
('Alice Johnson', 'Waiter', 'Monday-Friday 9:00-17:00', 2000),
('Bob Smith', 'Chef', 'Tuesday-Saturday 12:00-21:00', 3000);

INSERT INTO roles (role_name, description) VALUES
('Waiter', 'Serves customers and takes orders'),
('Chef', 'Prepares and cooks food');

INSERT INTO menu_inventory (menu_item_id, inventory_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

INSERT INTO employee_roles (employee_id, role_id) VALUES
(1, 1),
(2, 2);

INSERT INTO menu_item_price_history (menu_item_id, price, date_changed) VALUES
(1, 5.99, '2024-04-01 00:00:00'),
(2, 5.99, '2024-04-01 00:00:00'),
(3, 6.99, '2024-04-01 00:00:00'),
(4, 6.99, '2024-04-01 00:00:00'),
(5, 7.99, '2024-04-01 00:00:00');

INSERT INTO employee_role_history (employee_id, role_id, date_changed) VALUES
(1, 1, '2024-04-01 00:00:00'),
(2, 2, '2024-04-01 00:00:00');

INSERT INTO promotions (description, discount_percentage, start_date, end_date, menu_item_id) VALUES
('Weekend Special', 10, '2024-04-01', '2024-04-30', 1),
('Lunchtime Deal', 15, '2024-04-01', '2024-04-30', 2);
