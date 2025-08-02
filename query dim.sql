DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_region_store;


CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,  -- Format: YYYYMMDD
    full_date DATE,
    day_of_week INT,
    month INT,
    holiday_season BIT
);
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    category VARCHAR(50)
);
CREATE TABLE dim_region_store (
    region_store_key INT PRIMARY KEY IDENTITY(1,1),
    region VARCHAR(50),
    store_type VARCHAR(50)
);
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY IDENTITY(1,1),
    date_key INT FOREIGN KEY REFERENCES dim_date(date_key),
    product_id INT FOREIGN KEY REFERENCES dim_product(product_id),
    region_store_key INT FOREIGN KEY REFERENCES dim_region_store(region_store_key),
    sales_units INT,
    adjusted_revenue FLOAT,
    promotion_applied BIT,
    competitor_price_index FLOAT,
    economic_index FLOAT,
    weather_impact INT,
    price FLOAT,
    discount_percentage FLOAT,
    sales_revenue FLOAT
);
