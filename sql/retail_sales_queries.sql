-- Total Business KPI
SELECT 
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore_sales;

-- Category Performance Analysis
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Sub-Category Performance
SELECT 
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_profit DESC;

-- Region-wise Sales Analysis
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

-- Top 10 Products by Sales
SELECT 
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Loss-Making Products
SELECT 
    product_name,
    ROUND(SUM(profit), 2) AS total_loss
FROM superstore_sales
GROUP BY product_name
ORDER BY total_loss ASC
LIMIT 10;

-- Monthly Sales Trend
SELECT 
    order_year,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM superstore_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Discount Impact on Profit
SELECT 
    discount_bin,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore_sales
GROUP BY discount_bin
ORDER BY avg_profit DESC;

-- Customer Segment Analysis
SELECT 
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;

-- Top 10 Customers
SELECT 
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Shipping Mode Analysis
SELECT 
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(shipping_cost), 2) AS avg_shipping_cost
FROM superstore_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- Weekend vs Weekday Sales
SELECT 
    CASE 
        WHEN is_weekend = 1 THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    
    ROUND(SUM(sales), 2) AS total_sales

FROM superstore_sales
GROUP BY day_type;