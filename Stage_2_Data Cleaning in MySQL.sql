-- Check for duplicate records
SELECT 
    name, category, COUNT(*) AS total_records
FROM
    zepto_inventory
GROUP BY name , category
HAVING COUNT(*) > 1
ORDER BY total_records DESC;

-- Check for missing product names and categories
SELECT 
    *
FROM
    zepto_inventory
WHERE
    name IS NULL OR category IS NULL;
    
SELECT *
FROM zepto_inventory
WHERE name = ''
   OR category = '';
   
   
-- Check for invalid prices --------------------------- Found
SELECT *
FROM zepto_inventory
WHERE mrp <= 0
   OR discounted_selling_price <= 0;
   
-- Check discount percentages
SELECT 
    *
FROM
    zepto_inventory
WHERE
    discount_percent < 0
        OR discount_percent > 100;
        
-- Check product weights ------------------------------ Found
SELECT 
    *
FROM
    zepto_inventory
WHERE
    weight_in_gms <= 0;


-- Check inventory quantities
SELECT 
    *
FROM
    zepto_inventory
WHERE
    available_quantity < 0 OR quantity < 0;


