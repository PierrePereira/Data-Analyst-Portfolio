

--- Carbon Emissions Exploratory Data Analysis

---Dataset:
---Vehicle emissions dataset (2015-2025)


--- Which manufacturers tend to produce higher-emission vehicles?
SELECT Make AS Brand,
	ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD,
	COUNT(*) AS Total_Vehicles
FROM cars_carbon
WHERE Vehicle_Category LIKE '%ICE%'  AND Year <= 2025
Group BY Make
Order By Avg_Emissions DESC
Limit 20;

-- It is observed that Luxury-performance manufacturers have the highest average CO2 emissions;
-- however, these brands also have  smaller vehicle counts compared to large-scale manufacturers such as Mercedes-Benz, Ford, or Cherovolet. 

--- Which vehicle models have the highest average CO2 emissions?
SELECT 
    Make AS Brand,
    Model, 
    ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD,
    COUNT(*) AS Total_Vehicles
FROM Cars_carbon
WHERE Vehicle_Category LIKE '%ICE%' AND
 Year <= 2025
GROUP BY Make, Model
ORDER BY Avg_Emissions DESC
LIMIT 50;
-- It is observed that Vehicle models with the highest average CO2 emissions are predominantly high-performance sports cars and larger utility-focused vehicles, 
-- suggesting that vehicle size and performance characteristics may contribute to increased emissions. 

--- How do CO2 emissions differ across fuel types?
SELECT 
Fuel_Type, 
COUNT(*) AS Total_Model,
ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD
FROM Cars_carbon
WHERE Vehicle_Category LIKE '%ICE%'AND
 Year <= 2025
Group By Fuel_Type
Order by Avg_Emissions DESC;

---  What fuel types are used by the highest-emitting vehicle models?
SELECT Make AS Brand,
Model,
Fuel_Type, 
COUNT(*) AS Total_Vehicles,
ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD
FROM Cars_carbon
WHERE Vehicle_Category LIKE '%ICE%'AND
 Year <= 2025
Group By Fuel_Type, Make, Model
Order by Avg_Emissions DESC
LIMIT 10;
-- The highest-emitting vehicle models primarily use either Premium or Regular Gasoline. 
-- Premium fuel is common among high-performance and luxury vehicles, while Regular Gasoline appears frequently among larger SUVs and pickup trucks. 
-- This suggests that both vehicle performance and vehicle size may contribute to elevated CO2 emissions. 

--  How do emission trends vary by fuel type over time?
SELECT Year, Fuel_Type, 
ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD,
COUNT(*) AS Total_Vehicles
FROM Cars_carbon
WHERE Vehicle_Category LIKE '%ICE%'AND
 Year <= 2025
Group BY Year, Fuel_Type
Order By Year DESC; 
-- Emission trends differ based on fuel types over time. Vehicles that use 
-- a) Regular Gasoline  show a gradual decline in average CO2 emissions,
-- b) Premium Gasoline shows an initial decline in early years followed by an increase in 2020 and stabilization in the last few.In the year 2025 there is a drastic reduction in Premium gasline emissions. This could be because of a reduced number of vehicles using it that year.
-- c) Midgrade Gasoline  aslo showws am intial decline and  later levels out in recent  years.  Midgrade Gasoline consistently records the highest average emissions across most years, it should be noted that Midgrde gasloine has relatively small sample size. 
-- d) Diesel has  an overall upward trend in emissions. 

--- Are any vehicle models available that use multiple fuel types within the same model year? 

SELECT Make,
Model,
Year,
COUNT(DISTINCT Fuel_type) AS Fuel_Used
FROM Cars_carbon
GROUP BY Make, Model,Year
HAVING COUNT(DISTINCT Fuel_type) > 1 AND
 Year <= 2025
ORDER BY Fuel_used DESC;
-- Several vehicle models use  multiple fuel types within the same  year, this shows that fuel type comparisons are not limited to different vehicles. 
-- This allows us to analyse what effect fuel choice has on emissions and fuel economy for specific vehicle models of the same year.


--- Is there a difference in emissions for different fuel types but for the same vehicles in the same year?


WITH multi_fuel_cars AS (
    SELECT Make, Model,Year
    FROM Cars_carbon
	WHERE Year  <= 2025
    GROUP BY Make, Model, Year
    HAVING COUNT(DISTINCT Fuel_Type) > 1
)
SELECT 
    c.Make AS Brand,
    c.Model,
	c.Year,
    c.Fuel_Type,
    c.CO2_Emissions_g_per_mile,
    c.Combined_MPG AS Avg_MPG
FROM Cars_carbon AS c
INNER JOIN multi_fuel_cars m 
    ON c.Make = m.Make 
    AND c.Model = m.Model
     AND c.Year = m.Year
ORDER BY c.Model, c.Year DESC;
-- Analysis shows there is a difference in emissions and MPG of Models of the same year on different fuel types.
-- It is also observed that there is difference in emissions and MPG between Models of the same year and same fuel type. 

--- Could engine cylinder  help explain these differences? 
WITH multi_fuel_cars AS (
    SELECT Make, Model,Year
    FROM Cars_carbon
    GROUP BY Make, Model,Year
    HAVING COUNT(DISTINCT Fuel_Type) > 1 AND
 Year <= 2025
)
SELECT 
    c.Make AS Brand,
    c.Model,
	c.Year,
	c.Engine_Cylinders,
    c.Fuel_Type,
    c.CO2_Emissions_g_per_mile,
    c.Combined_MPG AS Avg_MPG
FROM Cars_carbon AS c
INNER JOIN multi_fuel_cars m 
    ON c.Make = m.Make 
    AND c.Model = m.Model AND c.Year = m.Year
ORDER BY c.Model, c.Year ASC;
-- Variation in the number of engine cylinders is associated with  a difference in emissions and MPG.
-- However futher analysis is required as Models of the same year with the same Fuel Type,  have different emissions and MPG.
-- This suggests additional factors are responsible.

--- Could Engine Size L explain the differences? 
WITH multi_fuel_cars AS (
    SELECT Make, Model,Year
    FROM Cars_carbon
    GROUP BY Make, Model,Year
    HAVING COUNT(DISTINCT Fuel_Type) > 1 AND
 Year <= 2025
)
SELECT 
    c.Make AS Brand,
    c.Model,
	c.Year,
	c.Engine_Cylinders,
	c.Engine_Size_L,
    c.Fuel_Type,
    c.CO2_Emissions_g_per_mile,
    c.Combined_MPG AS Avg_MPG
FROM Cars_carbon AS c
INNER JOIN multi_fuel_cars AS m 
    ON c.Make = m.Make 
    AND c.Model = m.Model AND c.Year = m.Year
ORDER BY c.Model, c.Year ASC;
-- Variation in the number of engine size is associated with a difference in emissions and MPG.
-- However futher analysis is required as Models of the same year with the same Fuel Type, and same Engine Cylinders have different emissions and MPG.
-- This suggests additional factors are responsible.


--- Could Transmission explain the differences? 
 
WITH multi_fuel_cars AS (
    SELECT Make, Model,Year    FROM Cars_carbon
    GROUP BY Make, Model,Year
    HAVING COUNT(DISTINCT Fuel_Type) > 1 AND
 Year <= 2025
)
SELECT 
    c.Make AS Brand,
    c.Model,
	c.Year,
	c.Engine_Cylinders,
	c.Engine_Size_L,
	c.Transmission,
    c.Fuel_Type,
    c.CO2_Emissions_g_per_mile,
    c.Combined_MPG AS Avg_MPG
FROM Cars_carbon AS c
INNER JOIN multi_fuel_cars AS m 
    ON c.Make = m.Make 
    AND c.Model = m.Model AND c.Year = m.Year
ORDER BY c.Model, c.Year ASC;
-- Variation in the number of transmission is associated with  a difference in emissions and MPG.
-- It is observed that no single factor contributes to emisions ut a comination of factors.

SELECT
    Engine_Cylinders,
    ROUND(AVG(CO2_Emissions_g_per_mile)) AS Avg_Emissions,
    ROUND(AVG(Combined_MPG),1) AS Avg_MPG
FROM Cars_carbon
GROUP BY Engine_Cylinders
ORDER BY Engine_Cylinders;

-- The above queries show: among vehicles of the same specifications and model year it is obseved those that use Mid Grade fuel tend to have higher emissions. This suggests that fuel type may play an important role in emissoions.


--- Is fuel economy (MPG) associated with CO2 emissions across fuel types?

SELECT 
Fuel_Type, 
COUNt(*) AS Total_Vehicles,
ROUND(AVG(CO2_Emissions_g_per_mile))  As Avg_Emissions,
	MIN(CO2_Emissions_g_per_mile) As Min_Emissions,
	Max(CO2_Emissions_g_per_mile) As Max_Emissions,
    Round(STDDEV(CO2_Emissions_g_per_mile), 2) AS Emission_SD,
ROUND(Avg(Combined_MPG),2) AS Avg_MPG_per_fuel,
ROUND(STDDEV(CO2_Emissions_g_per_mile),2) AS Emission_SD,
ROUND(STDDEV(Combined_MPG),2) AS MPG_SD
FROM Cars_carbon
WHERE Vehicle_Category LIKE '%ICE%' AND
 Year <= 2025
Group By Fuel_Type
Order by Avg_MPG_per_fuel DESC;
-- Higher emissions are associated with lower MPG however it can be noted that other factors play a role. 
-- That said vehicles that use Mid Grade Gasoline when comapred to vehicles of the same specifications tend to have lower MPG and higher emissions
