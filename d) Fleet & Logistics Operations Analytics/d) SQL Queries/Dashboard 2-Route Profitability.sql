SELECT *
FROM fuel_purchases;

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'fuel_purchases';

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'maintenance_records';

SELECT *
FROM maintenance_records;

--Create a view to calculate route profitability
CREATE OR REPLACE VIEW vw_route_profitability AS

WITH revenue AS (
    SELECT
        route_id,
        SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
    FROM loads
    GROUP BY route_id
),

fuel AS (
    SELECT
        l.route_id,
        SUM(fp.total_cost) AS fuel_cost
    FROM loads l
    JOIN trips t
        ON l.load_id = t.load_id
    JOIN fuel_purchases fp
        ON t.trip_id = fp.trip_id
    GROUP BY l.route_id
)

SELECT
    r.route_id,
    r.total_revenue,
    COALESCE(f.fuel_cost,0) AS fuel_cost,
    r.total_revenue - COALESCE(f.fuel_cost,0) AS gross_profit,
    ROUND(
        (
            (r.total_revenue - COALESCE(f.fuel_cost,0))
            / r.total_revenue
        )::numeric * 100,
        2
    ) AS profit_margin_pct
FROM revenue r
LEFT JOIN fuel f
ON r.route_id = f.route_id;


SELECT *
FROM vw_route_profitability;--Create a view to calculate route profitability
CREATE OR REPLACE VIEW vw_route_profitability AS

WITH revenue AS (
    SELECT
        route_id,
        SUM(revenue + fuel_surcharge + accessorial_charges) AS total_revenue
    FROM loads
    GROUP BY route_id
),

fuel AS (
    SELECT
        l.route_id,
        SUM(fp.total_cost) AS fuel_cost
    FROM loads l
    JOIN trips t
        ON l.load_id = t.load_id
    JOIN fuel_purchases fp
        ON t.trip_id = fp.trip_id
    GROUP BY l.route_id
)

SELECT
    r.route_id,
    r.total_revenue,
    COALESCE(f.fuel_cost,0) AS fuel_cost,
    r.total_revenue - COALESCE(f.fuel_cost,0) AS gross_profit,
    ROUND(
        (
            (r.total_revenue - COALESCE(f.fuel_cost,0))
            / r.total_revenue
        )::numeric * 100,
        2
    ) AS profit_margin_pct
FROM revenue r
LEFT JOIN fuel f
ON r.route_id = f.route_id;


SELECT *
FROM vw_route_profitability;


--Count of fuel purchases 
SELECT
    COUNT(*) AS fuel_rows,
    SUM(total_cost) AS total_fuel_cost
FROM fuel_purchases;

--Count of maintenance records 
   SELECT
    COUNT(*) AS maintenance_rows,
    SUM(total_cost) AS total_maintenance_cost
FROM maintenance_records;

SELECT
    l.route_id,
    SUM(fp.total_cost) AS fuel_cost
FROM loads l
JOIN trips t
    ON l.load_id = t.load_id
JOIN fuel_purchases fp
    ON t.trip_id = fp.trip_id
GROUP BY l.route_id
ORDER BY fuel_cost DESC
LIMIT 10;


-- Reveue By Route
SELECT
    r.route_id,
    SUM(
        l.revenue +
        l.fuel_surcharge +
        l.accessorial_charges
    ) AS total_revenue
FROM loads l
JOIN routes r
    ON l.route_id = r.route_id
GROUP BY r.route_id;

--Fuel Cost By Route
SELECT
    l.route_id,
    SUM(fp.total_cost) AS fuel_cost
FROM loads l
JOIN trips t
    ON l.load_id = t.load_id
JOIN fuel_purchases fp
    ON t.trip_id = fp.trip_id
GROUP BY l.route_id;


--Maintenance Cost Allocation
SELECT
    truck_id,
    SUM(total_cost) AS maintenance_cost
FROM maintenance_records
GROUP BY truck_id;



--Top 10 Routes by Profit
SELECT
    route_id,
    gross_profit
FROM vw_route_profitability
ORDER BY gross_profit DESC
LIMIT 10;

--Bottom 10 Routes by Profit
SELECT
    route_id,
    gross_profit
FROM vw_route_profitability
ORDER BY gross_profit ASC
LIMIT 10;

--Highest Margin Routes
SELECT
    route_id,
    profit_margin_pct
FROM vw_route_profitability
ORDER BY profit_margin_pct DESC
LIMIT 10;

--Lowest Margin Routes
SELECT
    route_id,
    profit_margin_pct
FROM vw_route_profitability
ORDER BY profit_margin_pct ASC
LIMIT 10;

--ROUTE PROFITABILITY SUMMARY
SELECT
    COUNT(*) AS total_routes,
    ROUND(AVG(profit_margin_pct)::numeric,2) AS avg_margin
FROM vw_route_profitability;

--Calculating Fuel Ratio
SELECT
    route_id,
    total_revenue,
    fuel_cost,
    fuel_cost / total_revenue AS fuel_ratio
FROM vw_route_profitability
ORDER BY fuel_ratio DESC;