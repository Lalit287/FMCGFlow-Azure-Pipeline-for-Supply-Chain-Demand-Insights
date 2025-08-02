INSERT INTO fact_sales (
    date_key,
    product_id,
    region_store_key,
    sales_units,
    adjusted_revenue,
    promotion_applied,
    competitor_price_index,
    economic_index,
    weather_impact,
    price,
    discount_percentage,
    sales_revenue
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
WHERE NOT EXISTS (
    SELECT 1 FROM fact_sales f
    WHERE f.date_key = CONVERT(INT, FORMAT(fs.date, 'yyyyMMdd'))
      AND f.product_id = fs.product_id
      AND f.region_store_key = rs.region_store_key
);
