SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'trips';

SELECT *
FROM trips;

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'trucks';

SELECT *
FROM trucks;

SELECT *
FROM customers;

--Create Fleet Performance View
CREATE OR REPLACE VIEW vw_fleet_performance AS

WITH truck_revenue AS (
    SELECT
        t.truck_id,
        COUNT(t.trip_id) AS total_trips,

        SUM(
            COALESCE(l.revenue, 0)
            + COALESCE(l.fuel_surcharge, 0)
            + COALESCE(l.accessorial_charges, 0)
        ) AS total_revenue

    FROM trips t

    JOIN loads l
        ON t.load_id = l.load_id

    GROUP BY t.truck_id
),

truck_fuel AS (
    SELECT
        truck_id,
        SUM(total_cost) AS fuel_cost,
        SUM(gallons) AS total_gallons

    FROM fuel_purchases

    GROUP BY truck_id),

 truck_maintenance AS (
    SELECT
        truck_id,
        SUM(total_cost) AS maintenance_cost

    FROM maintenance_records

    GROUP BY truck_id
)

SELECT
    tr.truck_id,
    tr.make,
    tr.model_year,

    COALESCE(r.total_trips, 0) AS total_trips,
    COALESCE(r.total_revenue, 0) AS total_revenue,

    COALESCE(f.fuel_cost, 0) AS fuel_cost,
    COALESCE(f.total_gallons, 0) AS total_gallons,

    COALESCE(m.maintenance_cost, 0) AS maintenance_cost,

    COALESCE(r.total_revenue, 0)
        - COALESCE(f.fuel_cost, 0)
        - COALESCE(m.maintenance_cost, 0)
        AS estimated_profit

FROM trucks tr

LEFT JOIN truck_revenue r
    ON tr.truck_id = r.truck_id

LEFT JOIN truck_fuel f
    ON tr.truck_id = f.truck_id

LEFT JOIN truck_maintenance m
    ON tr.truck_id = m.truck_id;

SELECT *
 FROM vw_fleet_performance;

  --Validate the view 
    SELECT *
FROM vw_fleet_performance
WHERE model_year = 2021
LIMIT 20;

--KPIS
--Total Revenue 
SELECT SUM(total_revenue)
FROM vw_fleet_performance;

--Total Fuel Cost
SELECT SUM(fuel_cost)
FROM vw_fleet_performance;

--Total Maintenance Cost
SELECT SUM(maintenance_cost)
FROM vw_fleet_performance;

--Estimated Fleet Profit
SELECT SUM(estimated_profit)
FROM vw_fleet_performance;

--Average Fuel Cost Per Trip
SELECT
    SUM(fuel_cost) /
    NULLIF(SUM(total_trips), 0) AS fuel_cost_per_trip
FROM vw_fleet_performance;
--Charts
--Top Revenue Trucks
SELECT
    truck_id,
    total_revenue
FROM vw_fleet_performance
ORDER BY total_revenue DESC
LIMIT 10;

--Highest Maintenance Cost Trucks
SELECT
    truck_id,
    maintenance_cost
FROM vw_fleet_performance
ORDER BY maintenance_cost DESC
LIMIT 10;

--Fuel Cost by Truck
SELECT
    truck_id,
    fuel_cost
FROM vw_fleet_performance
ORDER BY fuel_cost DESC;

--Trips Completed by Truck
SELECT
    truck_id,
    total_trips
FROM vw_fleet_performance
ORDER BY total_trips DESC;

--Most Profitable Trucks
SELECT
    truck_id,
    estimated_profit
FROM vw_fleet_performance
ORDER BY estimated_profit DESC
LIMIT 10;

--Change in High Value Customers
SELECT
    customer_name,

    total_revenue,

    annual_revenue_potential,

    annual_revenue_potential - total_revenue
        AS revenue_gap

FROM vw_customer_analysis

ORDER BY revenue_gap DESC;