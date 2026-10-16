-- 1. Create a dedicated database
CREATE DATABASE IF NOT EXISTS zepto_db;

-- 2. Select the database to use
USE zepto_db;

-- 3. Drop table if it already exists
DROP TABLE IF EXISTS zepto_inventory;

-- 4. Create the table structure matching the dataset columns
CREATE TABLE zepto_inventory (
    category VARCHAR(100),
    name VARCHAR(255),
    mrp DECIMAL(10, 2),
    discount_percent INT,
    available_quantity INT,
    discounted_selling_price DECIMAL(10, 2),
    weight_in_gms INT,
    out_of_stock ENUM('TRUE', 'FALSE'),
    quantity INT
);


