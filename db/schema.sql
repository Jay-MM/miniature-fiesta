DROP DATABASE IF EXISTS sabor_db;
CREATE DATABASE sabor_db;
USE sabor_db;

CREATE TABLE inventory(
  id INT NOT NULL AUTO_INCREMENT,
  item_name VARCHAR(63) NOT NULL,
  quantity INT NOT NULL,
  unit_price FLOAT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE customers(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(63) NOT NULL,
  contact_number VARCHAR(19),
  preferences VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE menu_items(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(63) NOT NULL,
  description VARCHAR(255),
  price FLOAT NOT NULL,
  category VARCHAR(96),
  quantity_available INT NOT NULL,
  inventory_id INT,
  FOREIGN KEY (inventory_id) REFERENCES inventory(id),
  PRIMARY KEY (id)
);

CREATE TABLE orders(
  id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  amount INT NOT NULL,
  status ENUM('Pending', 'Cooking', 'Ready', 'Delivered'),
  order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  PRIMARY KEY (id)
);

CREATE TABLE order_items(
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  menu_item_id INT NOT NULL,
  quantity INT NOT NULL,
  modifications VARCHAR(255),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id),
  PRIMARY KEY (id)
);

CREATE TABLE payment_processes(
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  total_payment FLOAT NOT NULL,
  status ENUM('Pending', 'Completed', 'Failed'),
  timedate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  PRIMARY KEY (id)
);

CREATE TABLE delivery(
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  timedate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status BOOLEAN,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  PRIMARY KEY (id)
);

CREATE TABLE pick_up(
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  timedate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status BOOLEAN,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  PRIMARY KEY (id)
);

CREATE TABLE employees(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(63) NOT NULL,
  role VARCHAR(63) NOT NULL,
  schedule VARCHAR(255),
  salary FLOAT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE roles(
  id INT NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(63) NOT NULL,
  description VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE menu_inventory(
  menu_item_id INT NOT NULL,
  inventory_id INT NOT NULL,
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id),
  FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE employee_roles(
  employee_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE menu_item_price_history(
  menu_item_id INT NOT NULL,
  price FLOAT NOT NULL,
  date_changed TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

CREATE TABLE employee_role_history(
  employee_id INT NOT NULL,
  role_id INT NOT NULL,
  date_changed TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (employee_id) REFERENCES employees(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE promotions(
  id INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(255) NOT NULL,
  discount_percentage FLOAT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  menu_item_id INT,
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id),
  PRIMARY KEY (id)
);
