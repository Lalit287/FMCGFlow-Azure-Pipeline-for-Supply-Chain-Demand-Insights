-- STEP 1: Insert into dim_date (skip if exists)
INSERT INTO dim_date (date_key, full_date, day_of_week, month, holiday_season)
SELECT DISTINCT
    CONVERT(INT, FORMAT(date, 'yyyyMMdd')) AS date_key,
    date,
    day_of_week,
    month,
    holiday_season
FROM fmcg_sales fs
WHERE NOT EXISTS (
    SELECT 1 FROM dim_date d
    WHERE d.date_key = CONVERT(INT, FORMAT(fs.date, 'yyyyMMdd'))
);

-- STEP 2: Insert into dim_product (skip duplicates)
INSERT INTO dim_product (product_id, category)
SELECT product_id, MIN(category) AS category
FROM fmcg_sales
WHERE product_id NOT IN (
    SELECT product_id FROM dim_product
)
GROUP BY product_id;


-- STEP 3: Insert into dim_region_store (skip duplicates)
INSERT INTO dim_region_store (region, store_type)
SELECT region, store_type
FROM (
    SELECT DISTINCT region, store_type
    FROM fmcg_sales
) AS sub
WHERE NOT EXISTS (
    SELECT 1 FROM dim_region_store rs
    WHERE rs.region = sub.region AND rs.store_type = sub.store_type
);

-- STEP 4: Insert into fact_sales (only if FK values exist)
INSERT INTO fact_sales (
    date_key, product_id, region_store_key,
    sales_units, adjusted_revenue, promotion_applied,
    competitor_price_index, economic_index, weather_impact,
    price, discount_percentage, sales_revenue
)
SELECT
    CONVERT(INT, FORMAT(fs.date, 'yyyyMMdd')) AS date_key,
    fs.product_id,
    rs.region_store_key,
    fs.sales_units,
    fs.adjusted_revenue,
    fs.promotion_applied,
    fs.competitor_price_index,
    fs.economic_index,
    fs.weather_impact,
    fs.price,
    fs.discount_percentage,
    fs.sales_revenue
FROM fmcg_sales fs
JOIN dim_region_store rs
    ON fs.region = rs.region AND fs.store_type = rs.store_type
WHERE EXISTS (
    SELECT 1 FROM dim_date d
    WHERE d.date_key = CONVERT(INT, FORMAT(fs.date, 'yyyyMMdd'))
)
AND EXISTS (
    SELECT 1 FROM dim_product p
    WHERE p.product_id = fs.product_id
)
AND NOT EXISTS (
    SELECT 1 FROM fact_sales f
    WHERE f.date_key = CONVERT(INT, FORMAT(fs.date, 'yyyyMMdd'))
      AND f.product_id = fs.product_id
      AND f.region_store_key = rs.region_store_key
);
