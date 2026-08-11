# Data Analytics Portfolio

## Portfolio Overview

This portfolio contains a collection of data analytics projects developed using **PostgreSQL, SQL, Excel, Power Query, Power Pivot, DAX, Tableau, and Git/GitHub**.

The projects cover different areas of analytics, including exploratory data analysis, operational performance, process analysis, data modelling, KPI development, and interactive dashboard design. Each project follows a similar analytical workflow of **data preparation, analysis, visualization, and interpretation**, while using different tools depending on the requirements of the dataset.

The portfolio also documents the limitations and assumptions identified during each analysis to provide context around how the results should be interpreted.

---

# Projects

## A) U.S. Car Market Carbon Emissions EDA 2015–2025

**PostgreSQL · Excel · Git**

### Project Overview

This project analyses CO₂ emissions from U.S. vehicles between **2015 and 2025**, with a focus on vehicle efficiency, fuel types, engine characteristics, and manufacturer-level differences.

The dataset contains **15,301 vehicle records**, allowing emissions patterns to be explored across different vehicle specifications and manufacturers.

### Data Preparation & Analysis

PostgreSQL was used to clean, standardize, and analyse the dataset. Manufacturer names and categorical values were standardized to improve consistency across the analysis.

SQL queries were developed using **JOINs, CTEs, GROUP BY, aggregate functions, filtering, and calculated fields** to investigate relationships between vehicle characteristics and emissions.

The analysis examined:

- CO₂ emissions by manufacturer
- Changes in emissions over time
- Emissions across fuel types
- The relationship between MPG and CO₂ emissions
- The relationship between engine size, cylinders, and emissions
- Differences between vehicles with similar specifications

Excel was then used to create visualizations and communicate the main findings with the help of case study.

### Key Learning

This project demonstrated how SQL can be used to transform a raw vehicle dataset into structured analytical outputs and how exploratory analysis can be used to identify relationships between vehicle characteristics and environmental performance.

It also highlighted the importance of considering **sample size and data coverage** when comparing manufacturers or vehicle categories.

### Limitations

The analysis is based on the vehicles represented in the dataset and therefore may not fully represent the entire U.S. vehicle market. Some manufacturers, fuel types, or vehicle categories have fewer observations than others, which can affect comparisons based on averages.


---

# B) Mining Process Performance Analysis

**Excel · Power Query · Power Pivot · DAX**

### Project Overview

This project analyses operational and process performance using a dataset containing more than **730,000 operational records**.

The objective was to transform a large operational dataset into a structured analytical model and develop an interactive Excel dashboard to monitor performance and quality metrics.

### Data Preparation

**Power Query** was used to clean and transform the source data before loading it into Power Pivot.

The preparation process included restructuring fields, handling data-quality issues, standardizing information, and preparing the dataset for analysis.

### Data Modelling & Analysis

A data model was developed using **Power Pivot**, with relationships established between the relevant datasets.

**DAX measures** were created to calculate the KPIs and analytical metrics used throughout the dashboard. This allowed the measures to update dynamically when users interacted with the dashboard.

### Dashboard

The final dashboard uses:

- Pivot Tables
- Pivot Charts
- DAX measures
- Slicers
- KPI cards
- Interactive filtering

The dashboard allows process performance and quality metrics to be analysed across different categories and periods.

### Key Learning

This project provided experience working with a substantially larger operational dataset and demonstrated how **Power Query, Power Pivot, and DAX** can be combined to create a reusable business intelligence workflow within Excel.

It also reinforced the importance of separating **data preparation, data modelling, and analysis** rather than relying on manual calculations within individual worksheets.

### Limitations

The analysis is dependent on the quality and completeness of the operational records available in the source dataset. Some performance metrics may also require additional operational context before being used for management decisions.


---

# C) Hospital Operations Management Dashboard

**Tableau**

### Project Overview

This project focuses on the development of an interactive **Hospital Operations Management Dashboard**.

The dashboard was designed specifically around hospital operations, with the objective of providing an overview of patient activity, capacity, and operational performance.

### Data Integration

Datasets were integrated within Tableau using **data relationships** rather than combining all of the datasets into a single table.

Calculated fields were created to generate the operational metrics required for the dashboard.

### KPI Development

The dashboard includes operational KPIs and comparative metrics covering areas such as:

- Patient activity
- Admission rate
- Refusal rate
- Bed availability
- Patient satisfaction
- Staff-related indicators
- Monthly trends
- Weekly activity

Parameters were used to allow users to dynamically select periods and change the information displayed in the dashboard.

### Dashboard Design

The dashboard uses:

- KPI cards
- Interactive filters
- Parameters
- Trend charts
- Comparative visualizations
- Sparkline-style indicators

The dashboard was designed to provide an operational overview while allowing users to investigate individual trends through filtering.

### Key Learning

This project developed my understanding of **Tableau relationships, calculated fields, parameters, filters, and interactive dashboard design**.

A key consideration during development was ensuring that the KPIs provided useful operational information rather than simply displaying large quantities of data.

### Limitations

The analysis is limited by the structure and timeframe of the hospital dataset. Some operational metrics may also require additional context to determine whether a change represents an improvement or deterioration in performance.



---

# D) Fleet & Logistics Operations Analytics

**PostgreSQL · SQL · Tableau**

### Project Overview

This project analyses fleet and logistics operations using multiple operational datasets stored in a **PostgreSQL relational database**.

The analysis focuses on **fleet utilization, revenue generation, fuel consumption, maintenance costs, estimated profitability, and customer revenue opportunities**.

### Database & Data Modelling

Multiple operational datasets were structured within PostgreSQL, including information relating to trucks, trips, loads, fuel purchases, maintenance records, and customers.

SQL was used to create reusable analytical datasets rather than performing calculations directly against individual source tables.

### SQL Analysis

The analysis uses:

- JOINs
- CTEs
- GROUP BY
- Aggregate functions
- Window functions
- CASE statements
- COALESCE
- SQL views

A primary analytical view, `vw_fleet_performance`, was created to consolidate truck-level operational metrics.

The view combines:

- Total trips
- Total revenue
- Fuel costs
- Total gallons
- Maintenance costs
- Estimated profit

The underlying operational tables were aggregated before being joined at the truck level to reduce the risk of duplicated calculations caused by different levels of detail between datasets.

### Fleet Analysis

The analysis compares trucks based on revenue, trips completed, fuel costs, maintenance costs, and estimated profitability.

This allows higher-performing and lower-performing trucks to be identified and provides a basis for investigating potential relationships between operating costs and revenue generation.

Additional analysis was performed on fuel cost per trip and overall fleet profitability.

### Customer Analysis

A separate customer analysis was used to identify potential revenue opportunities.

The analysis compares current customer revenue against estimated annual revenue potential and calculates a **revenue gap**:

> Revenue Gap = Annual Revenue Potential − Current Revenue

Customers with larger revenue gaps can therefore be identified as potential opportunities for increasing revenue.

### Tableau Dashboard

The SQL outputs were used as the analytical foundation for Tableau visualizations.

The dashboard provides an interactive view of fleet performance and allows operational metrics to be compared across trucks and other relevant categories.

### Key Learning

This project brought together several areas of the portfolio by combining **relational database design, SQL analysis, analytical views, KPI development, and Tableau visualization**.

It also demonstrated the importance of aggregating data at the appropriate level before joining datasets with different granularities.

### Limitations

Route profitability can be difficult to interpret without additional information about route structure and demand.

For example, a route such as **New York → Philadelphia** may appear to generate relatively low profitability when analysed independently. However, it may represent a stop or segment within a longer journey, such as **New York → Atlanta**, rather than a standalone route.

Therefore, short routes cannot necessarily be classified as unprofitable based solely on their profit percentage. Demand, route structure, trip frequency, and whether the route forms part of a larger journey would need to be considered.

Similarly, the `estimated_profit` metric represents revenue less fuel and maintenance costs and does not include other operating costs such as driver wages, insurance, depreciation, tolls, or administrative overhead.


---

# Technical Skills

### SQL & PostgreSQL

- Data exploration
- Data cleaning
- JOINs
- CTEs
- GROUP BY
- Aggregate functions
- Window functions
- CASE statements
- NULL handling
- COALESCE
- Analytical views
- Relational data modelling

### Excel & Microsoft Power BI Tools

- Excel
- Pivot Tables
- Pivot Charts
- Power Query
- Power Pivot
- DAX
- Data modelling
- Slicers
- KPI development
- Interactive dashboards

### Tableau

- Data relationships
- Calculated fields
- Parameters
- Filters
- KPI cards
- Interactive dashboards
- Trend analysis
- Operational reporting

### Supporting Tools

- Git
- GitHub

---

# Overall Portfolio

The four projects demonstrate experience across different stages of the data analytics process.

The **Car Market project** focused on SQL-based exploratory analysis and data cleaning. The **Mining project** expanded this into larger-scale operational data preparation, data modelling, and DAX-based analysis in Excel.

The **Hospital project** focused on Tableau dashboard development, data relationships, parameters, and interactive operational reporting. The **Fleet & Logistics project** combined relational database design, SQL analysis, analytical views, operational KPIs, customer analysis, and Tableau visualization.

Together, the projects demonstrate experience working with different types of datasets and analytical tools while maintaining a focus on **data quality, appropriate metric design, visualization, interpretation, and business context**.

The projects also reflect an increasing emphasis on moving beyond simply calculating metrics and considering **why the results occur, what assumptions are being made, and what limitations should be considered when interpreting the findings**.

---

# Continued Development

Development of existing skills and towards new skills is on going in:

- Advanced SQL
- PostgreSQL
- Data modelling
- Excel and DAX
- Tableau
- Python
- Business intelligence
- Data visualization
- Data storytelling
- Business-focused analysis

This portfolio will continue to be updated as new projects and analytical techniques are developed. 
