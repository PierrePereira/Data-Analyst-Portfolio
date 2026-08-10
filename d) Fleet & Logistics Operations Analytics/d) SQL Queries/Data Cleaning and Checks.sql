
--Data Quality Check
SELECT *
FROM routes;

--Duplicate Primary keys check
     --Trip_id
     SELECT trip_id,
     COUNT(*)
     FROM trips
     GROUP BY trip_id
     HAVING COUNT(*) > 1;

--Driver_id 
     SELECT driver_id,
     COUNT(*)
     FROM drivers
     GROUP BY driver_id
     HAVING COUNT(*) > 1;
     --Customer_id
     SELECT customer_id,
     COUNT(*)
     FROM customers
     GROUP BY customer_id
     HAVING COUNT(*) > 1;

--Event_id
     SELECT event_id,
     COUNT(*)
     FROM delivery_events
     GROUP BY event_id
     HAVING COUNT(*) > 1;

  --Facility_id
     SELECT facility_id,
     COUNT(*)
     FROM facilities
     GROUP BY facility_id
     HAVING COUNT(*) > 1;

--fuel_purchase_id
     SELECT fuel_purchase_id,
     COUNT(*)
     FROM fuel_purchases
     GROUP BY fuel_purchase_id
     HAVING COUNT(*) > 1;

--Load_id
     SELECT load_id,
     COUNT(*)
     FROM loads
     GROUP BY load_id
     HAVING COUNT(*) > 1;

  --Maintenance_id
     SELECT maintenance_id,
     COUNT(*)
     FROM maintenance_records
     GROUP BY maintenance_id
     HAVING COUNT(*) > 1;

--Route_id
     SELECT route_id,
     COUNT(*)
     FROM routes
     GROUP BY route_id
     HAVING COUNT(*) > 1;

--Incident_id
     SELECT incident_id,
     COUNT(*)
     FROM safety_incidents
     GROUP BY incident_id
     HAVING COUNT(*) > 1;

--Trailer_id
     SELECT trailer_id,
     COUNT(*)
     FROM trailers
     GROUP BY trailer_id
     HAVING COUNT(*) > 1;

--Trip_id
     SELECT trip_id,
     COUNT(*)
     FROM trips
     GROUP BY trip_id
     HAVING COUNT(*) > 1;

--Truck_id
     SELECT truck_id,
     COUNT(*)
     FROM trucks
     GROUP BY truck_id
     HAVING COUNT(*) > 1;





--  Duplicate data Check
SELECT *, 
COUNT(*) AS duplicate_count
FROM drivers
GROUP BY driver_id,
    first_name, 
    last_name, 
    hire_date, 
    termination_date,
    license_number,
    license_state,
    date_of_birth,
    home_terminal,
    employment_status,
    cdl_class,
    years_experience
    HAVING COUNT(*) > 1;

-- Checking for NULLS/Missing Values
SELECT
    COUNT(*) - COUNT(driver_id) AS driver_id_nulls,
    COUNT(*) - COUNT(first_name) AS first_name_nulls,
    COUNT(*) - COUNT(last_name) AS last_name_nulls,
    COUNT(*) - COUNT(license_number) AS license_number_nulls,
    COUNT(*) - COUNT(termination_date) AS termination_date_nulls
FROM drivers;

--Inconsistent Data Check
SELECT DISTINCT employment_status
FROM drivers;

SELECT DISTINCT fuel_type
FROM trucks;

SELECT DISTINCT status
FROM trucks;

SELECT DISTINCT cdl_class
FROM drivers;

SELECT *
FROM routes
WHERE typical_distance_miles <= 0;

SELECT *
FROM loads
WHERE revenue < 0;


