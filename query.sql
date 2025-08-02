DROP TABLE IF EXISTS fmcg_sales;
GO

CREATE TABLE fmcg_sales (
    date DATE,
    product_id INT,
    sales_units INT,
    holiday_season INT,
    promotion_applied INT,
    competitor_price_index FLOAT,
    economic_index FLOAT,
    weather_impact INT,
    price FLOAT,
    discount_percentage FLOAT,
    sales_revenue FLOAT,
    region VARCHAR(50),
    store_type VARCHAR(50),
    category VARCHAR(50),
    future_demand FLOAT,
    day_of_week INT,
    month INT,
    is_weekend INT,
    adjusted_revenue FLOAT
);
