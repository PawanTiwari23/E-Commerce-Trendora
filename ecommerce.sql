-- 📦 Create and use the ecommerce database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- 👤 Users
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

-- 🗂 Categories
CREATE TABLE IF NOT EXISTS categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- 🛍️ Products
CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DOUBLE NOT NULL,
  image VARCHAR(255),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- 🛒 Cart
CREATE TABLE IF NOT EXISTS cart (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  quantity INT DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ⭐ Watchlist
CREATE TABLE IF NOT EXISTS watchlist (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 🧾 Orders
CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  product_id INT,
  quantity INT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 👥 Insert Users
INSERT INTO users (name, email) VALUES
('Ravi Kumar', 'ravi@example.com'),
('Anjali Sharma', 'anjali@example.com'),
('Vikash Singh', 'vikash@example.com');

-- 🗂 Insert Categories
INSERT INTO categories (name) VALUES
('Electronics'),
('Accessories'),
('Wearables'),
('Gaming'),
('Home Appliances'),
('Books');

-- 🛍️ Insert Products
INSERT INTO products (name, description, price, image, category_id) VALUES
('Smartphone X', '5G-enabled AMOLED display', 34999, 'https://via.placeholder.com/150?text=Smartphone', 1),
('Laptop Pro', '16GB RAM, 512GB SSD', 75999, 'https://via.placeholder.com/150?text=Laptop', 1),
('Wireless Headphones', 'Noise-cancelling over-ear headphones', 7999, 'https://via.placeholder.com/150?text=Headphones', 2),
('Gaming Mouse', 'RGB mouse with high DPI', 1999, 'https://via.placeholder.com/150?text=Mouse', 4),
('Smartwatch Z', 'Fitness tracker with GPS', 4999, 'https://via.placeholder.com/150?text=Smartwatch', 3),
('Bluetooth Speaker', 'Portable speaker with deep bass', 2999, 'https://via.placeholder.com/150?text=Speaker', 2),
('Microwave Oven', '20L convection microwave oven', 8999, 'https://via.placeholder.com/150?text=Microwave', 5),
('Air Purifier', 'HEPA filter and silent operation', 10999, 'https://via.placeholder.com/150?text=Purifier', 5),
('Fitness Band', 'Tracks steps, calories, sleep', 2999, 'https://via.placeholder.com/150?text=Band', 3),
('The Psychology of Money', 'Book by Morgan Housel', 499, 'https://via.placeholder.com/150?text=Book', 6);

-- 🛒 Insert Cart Items
INSERT INTO cart (user_id, product_id, quantity) VALUES
(1, 1, 2),  -- Ravi has 2 Smartphones
(1, 4, 1),  -- Ravi has 1 Gaming Mouse
(2, 2, 1),  -- Anjali has 1 Laptop
(2, 3, 1),  -- Anjali has 1 Wireless Headphone
(3, 6, 3);  -- Vikash has 3 Bluetooth Speakers

-- ⭐ Insert Watchlist Items
INSERT INTO watchlist (user_id, product_id) VALUES
(1, 5), -- Ravi watchlisted Smartwatch
(1, 8), -- Ravi watchlisted Air Purifier
(2, 10), -- Anjali watchlisted book
(3, 7), -- Vikash watchlisted Microwave

-- 🧾 Insert Orders
INSERT INTO orders (user_id, product_id, quantity) VALUES
(1, 2, 1),  -- Ravi ordered 1 Laptop
(2, 4, 2),  -- Anjali ordered 2 Gaming Mouse
(3, 9, 1);  -- Vikash ordered 1 Fitness Band
