USE ghana_retail_analytics;
INSERT INTO sales
(sale_date, product_name, category, quantity, unit_price, total_amount, region)
VALUES
('2026-01-05', 'Rice', 'Groceries', 10, 250, 2500, 'Accra'),
('2026-01-06', 'Cooking Oil', 'Groceries', 5, 180, 900, 'Kumasi'),
('2026-01-07', 'Sugar', 'Groceries', 8, 120, 960, 'Tema'),
('2026-01-08', 'Milk', 'Dairy', 12, 35, 420, 'Accra'),
('2026-01-09', 'Bread', 'Bakery', 20, 15, 300, 'Koforidua');
SELECT * FROM sales;
SELECT SUM(total_amount) AS total_revenue
FROM sales;
SELECT * FROM sales;
SELECT COUNT(*) AS total_records FROM sales;
SELECT SUM(total_amount) AS total_revenue
FROM sales;
SELECT sale_id, product_name, quantity, unit_price, total_amount
FROM sales;
SELECT
    product_name,
    SUM(total_amount) AS product_revenue
FROM sales
GROUP BY product_name
ORDER BY product_revenue DESC;
SELECT
    region,
    SUM(total_amount) AS regional_revenue
FROM sales
GROUP BY region
ORDER BY regional_revenue DESC;
SELECT
    category,
    SUM(quantity) AS units_sold,
    SUM(total_amount) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;
SELECT AVG(total_amount) AS average_sale
FROM sales;
SELECT
    product_name,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product_name
ORDER BY total_units_sold DESC
LIMIT 1;
SELECT
    MONTH(sale_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY sales_month;
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS missing_dates,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS missing_products,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantities,
    SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS missing_amounts
FROM sales;
SELECT
    sale_id,
    product_name,
    quantity,
    unit_price,
    total_amount,
    (quantity * unit_price) AS calculated_amount
FROM sales
WHERE total_amount <> (quantity * unit_price);

SELECT COUNT(*) AS total_transactions
FROM sales;
SELECT AVG(total_amount) AS average_sale_value
FROM sales;
SELECT SUM(quantity) AS total_units_sold
FROM sales;
SELECT COUNT(DISTINCT product_name) AS unique_products
FROM sales;
SELECT COUNT(DISTINCT region) AS total_regions
FROM sales;
SELECT region, SUM(total_amount) AS regional_revenue
FROM sales
GROUP BY region
ORDER BY regional_revenue DESC;
SELECT product_name, SUM(total_amount) AS product_revenue
FROM sales
GROUP BY product_name
ORDER BY product_revenue DESC;
SELECT category, SUM(total_amount) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;
SELECT MAX(total_amount) AS highest_sale,
       MIN(total_amount) AS lowest_sale
FROM sales;
SELECT payment_method, SUM(total_amount) AS payment_revenue
FROM sales
GROUP BY payment_method
ORDER BY payment_revenue DESC;
DESCRIBE sales;
SELECT DATE_FORMAT(sales_date, '%Y-%m') AS sales_month,
       SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY sales_month
ORDER BY sales_month;
SELECT sales_date
FROM sales
LIMIT 5;
SHOW COLUMNS FROM sales;
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
       SUM(total_amount) AS monthly_revenue
FROM sales
GROUP BY sales_month
ORDER BY sales_month;
SELECT region, COUNT(*) AS transaction_count
FROM sales
GROUP BY region
ORDER BY transaction_count DESC;
SELECT COUNT(*) AS total_transactions
FROM sales;
SELECT MIN(sale_date) AS first_sale,
       MAX(sale_date) AS last_sale
FROM sales;