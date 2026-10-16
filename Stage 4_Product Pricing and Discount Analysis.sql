-- Q1. Find the top 10 best-value products based on discount percentage
-- Business objective: Identify the ten products offering the highest percentage discounts.

SELECT 
    name,
    category,
    mrp / 100 AS mrp_in_rupees,
    discount_percent,
    discounted_selling_price / 100 AS selling_price_in_rupees
FROM
    zepto_inventory_clean
ORDER BY discount_percent DESC
LIMIT 10;



-- Q2. Identify products with high MRP that are out of stock
-- The purpose of this analysis is to find expensive products that are currently marked as out of stock in the dataset.
SELECT 
    name,
    category,
    mrp / 100 AS mrp_in_rupees,
    discount_percent,
    discounted_selling_price / 100 AS selling_price_in_rupees,
    available_quantity
FROM
    zepto_inventory_clean
WHERE
    mrp > 50000 AND out_of_stock = 'TRUE'
ORDER BY mrp DESC;


-- the estimated value of available inventory by category
 SELECT 
    category,
    ROUND(SUM(discounted_selling_price * available_quantity) / 100, 2) AS inventory_value
FROM
    zepto_inventory_clean
WHERE
    out_of_stock = 'FALSE'
GROUP BY category
ORDER BY inventory_value DESC;
 
 
 
 -- Find products with MRP greater than ₹500 and discounts below 10%
 SELECT 
    name,
    category,
    mrp / 100 AS mrp_in_rupees,
    discount_percent,
    discounted_selling_price / 100 AS selling_price_in_rupees
FROM
    zepto_inventory_clean
WHERE
    mrp > 50000 AND discount_percent < 10
ORDER BY mrp DESC LIMIT 5;
 
 
 
-- Find the top 5 categories offering the highest average discount percentage
SELECT 
    category,
    ROUND(AVG(discount_percent), 2) AS average_discount
FROM
    zepto_inventory_clean
GROUP BY category
ORDER BY average_discount DESC
LIMIT 5;

-- Calculate price per gram for products weighing more than 100 grams
SELECT 
    name,
    category,
    weight_in_gms,
    ROUND(discounted_selling_price / 100, 2),
    ROUND((discounted_selling_price / 100) / weight_in_gms,
            2) AS price_per_gms
FROM
    zepto_inventory_clean
WHERE
    weight_in_gms > 100
ORDER BY price_per_gms
LIMIT 5;


-- Group products into Low, Medium, and Bulk categories
SELECT 
    CASE
        WHEN weight_in_gms <= 100 THEN 'Low'
        WHEN weight_in_gms <= 500 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category,
    COUNT(*) AS total_products
FROM
    zepto_inventory_clean
GROUP BY weight_category
ORDER BY total_products DESC;

-- Calculate total inventory weight per category
SELECT 
    category,
    SUM((weight_in_gms * available_quantity)/1000) AS total_inventory_weight_kgs
FROM
    zepto_inventory_clean
WHERE
    out_of_stock = 'FALSE'
GROUP BY category
ORDER BY total_inventory_weight_kgs DESC;