# Logistics Operations and Revenue Analysis
[View Dashboard 1 Revenue and Profitability Analysis on Tableau Public](https://public.tableau.com/shared/YH8C7HTSP?:display_count=n&:origin=viz_share_link)

[View Dashboard 2 Route Profitability Overview on Tableau Public](https://public.tableau.com/views/Dashboard2-RouteProfitability/Dashboard2RouteProfitability?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[View Dashboard 3 Fleet Optimisation & Maintaince Performance on Tableau Public](https://public.tableau.com/views/Dashboard3FleetPerformanceAssetUtilization/Dashboard3FleetOptimisationMaintaincePerformance?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Project Overview

This project looks into logistics and Supply Chain of a  Transportation business. In order to  improve operational efficiency and profitability the analysis is conducted on the revenue, route profitability, customer activity, and fleet performance

The tools used to analyse the availible data is SQL and Tableau. SQL was used to prepare and understand the data, while Tableau was used to build interactive dashboards to convey key performance metrics. The analysis examines how revenue varies across customers, booking types, and freight types, while also investigating route profitability and fleet maintaince and performance.

## Data Overview

The dataset contains information related to operations, including customer activity, freight bookings, routes, revenue, fuel costs, vehicle information, and maintenance. Origin and destination information was joined to the original operational data using Route ID, allowing route-level performance to be analysed geographically.

## Key metrics and fields used in this analysis include:

Customer Name
Customer Type
Account Status
Booking Type
Primary Freight Type
Origin State
Origin City
Destination State
Destination City
Route ID
Total Revenue
Revenue per Load
Annual Revenue Potential
Fuel Cost
Profit
Profit %
Credit Term Days
Vehicle Brand
Maintenance Cost
Vehicle Status


## Data Cleaning and Limitations

Prior to analysis, the datasets were reviewed and prepared using SQL before being added to Tableau. SQL was used to organise and, combine related information, and create the fields required for analysis. Origin and destination information was joined to the original operational data using Route ID, allowing route performance to be analysed by state and city.

One limitation of the analysis is that route profitability can vary significantly depending on the length of a route and the operating costs associated with each journey. The dataset does not indicate whether a route represents a segment of a longer journey, making it difficult to determine the true profitability of individual route segments.Shorter routes, may seem less profitable, but their performance can depend on how the route is integrated within the wider transportation network.

## Research Questions

How does revenue vary across customers, booking types, and freight types?

Which customers generate the highest revenue and how does actual revenue compare with their annual revenue potential?

Which routes generate the highest and lowest profitability?

How do fuel costs relate to route revenue and profitability?

How does fleet maintenance cost vary across vehicle brands? 

What is the time a vehicle is down when its scheduled for maintaince?

How does vehicle status change over time?

What operational factors are associated with differences in route profitability?

## Methodology

The data was structured to connect customer, load, route, and vehicle information, with origin and destination fields linked to the operational data through Route ID. Calculated metrics such as revenue per load, profit percentage, and annual revenue potential were then used within Tableau to support the analysis.

Three interactive  dashboards were developed to provide different operational insights. Dashboards 1 looks into  revenue and customer performance, Dashboard 2 examines route profitability and fuel costs, Dahbaord 3 examines  fleet performance and maintenance. Tableau parameters, filters, calculated fields, dashboard actions, and geographic visualisations were used to convey clear performance and operational metrics.

## Key Findings

### 1. Revenue Varies Significantly Across Booking Types

Revenue was analysed across the different booking types to understand the contribution of each type to overall performance. The analysis showed differences in revenue contribution between booking types; dedicated loads represented a substantial share of revenue when compared to Spot and Contract.

Suggesting that booking type is an important factor when evaluating revenue and should be considered when assessing customer and operational performance.

### 2. Revenue Concentration Varies Across Customers

The analysis identified that  small number of customers contribute substantially more revenue than others, highlighting the importance of customer concentration when evaluating overall business performance.

Annual Revenue Potential was also compared with actual customer revenue to identify customers where current revenue may be below their future potential. These customers may represent opportunities for increasing business activity or improving customer retention and account development.

### 3. Route Profitability Varies Significantly

Route-level analysis showed substantial differences in profitability between origin and destination combinations. Most routes generated stronger profit percentages, while some shorter routes show low or negative profitability.

The results highlight the importance of considering route-specific revenue and operating costs rather than evaluating profitability only at an overall company level. Differences between outbound and return routes can also contribute to variations in route profitability, as well as routes within the larger logistics network.

### 4. Fuel Costs Are an Important Route-Level Cost

Fuel cost was analysed alongside route revenue and profitability to investigate how transportation costs affect route performance. Routes with higher fuel costs do not necessarily generate proportionally higher revenue, meaning that higher revenue alone does not guarantee higher profitability.

Comparing revenue and fuel cost at the route level provides a clearer view of which routes may require further investigation and where cost management could improve profitability.

### 5. Fleet Maintenance Performance Varies Across Vehicle Brands

Vehicle brands were analysed based on maintenance costs to identify differences in fleet operating expenses. The analysis showed variation in maintenance costs across vehicle brands, suggesting that vehicle selection and maintenance requirements can contribute to differences in fleet operating costs.

Vehicle status was also analysed over time using Active, Inactive, and Maintenance categories to provide a view of fleet availability and maintenance activity. This can help identify periods where a larger proportion of the fleet may be unavailable for operations.

## Conclusion

This analysis shows that logistics performance varies considerably across customers, booking types, routes, fuel costs, and vehicle characteristics. Revenue concentration among customers and differences in route profitability highlight areas where more detailed operational and financial analysis could support better decision-making.

## Recommended Next Steps

Investigate the most and least profitable routes in greater detail by comparing distance, fuel consumption, revenue, and return-route performance to identify opportunities for route optimisation.

Analyse customer revenue potential and account activity to identify customers with high growth potential but relatively low current revenue. Further analysis could also examine whether booking type, freight type, and credit terms influence customer profitability.

Develop predictive models to estimate route profitability using revenue, fuel cost, route characteristics, and customer information.

Investigate vehicle maintenance costs by brand, vehicle age, and maintenance status to identify fleet replacement or maintenance optimisation opportunities.
