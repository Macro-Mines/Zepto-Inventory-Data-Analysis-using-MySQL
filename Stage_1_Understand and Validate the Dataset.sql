-- Check whether the data was imported correctly
SELECT 
    *
FROM
    zepto_inventory
LIMIT 10;

-- Find the total number of records 
SELECT 
    COUNT(*) AS total_products
FROM
    zepto_inventory;

-- Identify all product categories
SELECT DISTINCT
    category
FROM
    zepto_inventory;

-- Count products in each category
SELECT 
    category, COUNT(*) AS total_products
FROM
    zepto_inventory
GROUP BY category
ORDER BY total_products DESC;


-- Check stock availability
SELECT 
    out_of_stock, COUNT(*) AS total_products
FROM
    zepto_inventory
GROUP BY out_of_stock;

-- Check for missing values
SELECT 
    COUNT(*) AS total_rows,
    COUNT(category) AS category_count,
    COUNT(name) AS name_count,
    COUNT(mrp) AS mrp_count,
    COUNT(discount_percent) AS discount_count,
    COUNT(available_quantity) AS available_quantity_count,
    COUNT(discounted_selling_price) AS selling_price_count,
    COUNT(weight_in_gms) AS weight_count,
    COUNT(out_of_stock) AS stock_status_count,
    COUNT(quantity) AS quantity_count
FROM
    zepto_inventory;

-- Displays the ten records with the highest stored MRP values
SELECT
    name,
    mrp,
    discounted_selling_price,
    discount_percent
FROM zepto_inventory
ORDER BY mrp DESC
LIMIT 10;

