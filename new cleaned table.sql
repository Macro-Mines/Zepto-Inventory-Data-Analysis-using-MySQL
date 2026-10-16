SELECT 
    *
FROM
    zepto_inventory_clean
LIMIT 10;

-- Verify that the invalid values are gone
SELECT 
    *
FROM
    zepto_inventory_clean
WHERE
    mrp <= 0
        OR discounted_selling_price <= 0
        OR weight_in_gms <= 0;
        

-- number of records in clean dataset
SELECT 
    COUNT(*) AS total_clean_records
FROM
    zepto_inventory_clean;