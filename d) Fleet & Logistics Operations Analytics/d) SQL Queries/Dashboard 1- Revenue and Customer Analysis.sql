SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'loads';

SELECT *
FROM loads;

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'customers';


SELECT *
FROM customers;

--Total Revenue
SELECT
    SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
FROM loads;
--Total Loads
SELECT
    COUNT(*) AS total_loads
FROM loads;

--Revenue per Load
SELECT
    ROUND(
        AVG(revenue + fuel_surcharge + accessorial_charges)::numeric,
        2
    ) AS revenue_per_load
FROM loads;

--Total Customers
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM loads;

--Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', load_date::date) AS month,
    SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
FROM loads
GROUP BY 1
ORDER BY 1;

--High Value Customers by Revenue
SELECT
    c.customer_name,
    ROUND(SUM(
        l.revenue +
        l.fuel_surcharge +
        l.accessorial_charges
    )::numeric, 2) AS total_revenue
FROM loads l
JOIN customers c
ON l.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

--Revenue by load type
SELECT
    load_type,
    SUM(revenue + fuel_surcharge + accessorial_charges) AS revenue
FROM loads
GROUP BY load_type
ORDER BY revenue DESC;

--Revenue by booking type
SELECT
    booking_type,
    SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
FROM loads
GROUP BY booking_type
ORDER BY total_revenue DESC;

--YOY Revenue
SELECT
    EXTRACT(YEAR FROM load_date::date) AS year,
    SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
FROM loads
GROUP BY 1
ORDER BY 1;