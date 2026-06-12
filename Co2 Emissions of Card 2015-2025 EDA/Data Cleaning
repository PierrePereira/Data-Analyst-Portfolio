CREATE TABLE cars_carbon (
    Make TEXT,
    Model TEXT,
    Year INT,
    Fuel_Type TEXT,
    Engine_Cylinders NUMERIC,
    Engine_Size_L NUMERIC,
    Drivetrain TEXT,
    Transmission TEXT,
    City_MPG INT,
    Highway_MPG INT,
    Combined_MPG INT,
    CO2_Emissions_g_per_mile INT,
    EV_Range_miles INT,
    vehicle_category TEXT
);



SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'cars_carbon'
ORDER BY ordinal_position;
;


--- Data Cleaning
SELECT *
FROM cars_carbon;

SELECT COUNT(*)
FROM cars_carbon;


-- Checking inconsistent make names
SELECT DISTINCT Make
FROM cars_carbon
ORDER BY Make;
--
SELECT *
FROM cars_carbon
WHERE "vehicle_category" NOT LIKE '%ICE%'
ORDER BY CO2_Emissions_g_per_mile;


-- Checking for duplicates
SELECT *,
       COUNT(*) AS duplicate_count
FROM cars_carbon
GROUP BY
    Make, Model, Year, Fuel_Type,
    Engine_Cylinders, Engine_Size_L,
    Drivetrain, Transmission,
    City_MPG, Highway_MPG,
    Combined_MPG,
    CO2_Emissions_g_per_mile,
    EV_Range_miles,
    Vehicle_Category
HAVING COUNT(*) > 1;

-- Fixing Inconsistent name
UPDATE cars_carbon
SET Make = 'Mini'
WHERE Make = 'MINI';
--The Make Mini appears twice one in uppercase and the other in regular case.

--Checking inconsistent fuel types
SELECT DISTINCT Fuel_Type
FROM cars_carbon
ORDER BY Fuel_Type;

--Checking for Missing or Null values
SELECT
    COUNT(*) AS total_rows,
    COUNT(Make) AS make_count,
    COUNT(Model) AS model_count,
    COUNT(Year) AS year_count,
    COUNT(Fuel_Type) AS fuel_type_count,
    COUNT(CO2_Emissions_g_per_mile) AS emissions_count
FROM cars_carbon;
-- Honda CRV- FCEV has a null value under fuel type. 
--External research found its a hybrid vehicle that uses Hydrogen fuel cells and electricity.

--Check for Invalid Year Values
SELECT MIN(Year), MAX(Year)
FROM cars_carbon;

SELECT DISTINCT (YEAR)
FROM cars_carbon
Order By Year ASC;

-- Unusual Emission values
SELECT *
FROM cars_carbon
WHERE CO2_Emissions_g_per_mile <= 0;
-- Electric and Hydrogen vehciles show zero emission.
