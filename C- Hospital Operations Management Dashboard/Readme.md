# Hospital Operations Management
[View Interactive Dashboard on Tableau Public](https://public.tableau.com/shared/MR3NR439C?:display_count=n&:origin=viz_share_link)
## Project Overview

This project uses Tableau to explore hospital operational data and how performance varies across hospital services and reporting periods. The analysis focuses on available beds, patient requests, admitted patients, admission rate, refusal rate, patient satisfaction, and staff morale. The purpose of this dashboard is to provide an interactive overview of hospital operations and identify areas that could support further investigation.

## Data Overview

The dataset contains information on hospital patients, services, bed availability, patient requests, admissions, refusals, patient satisfaction, staff morale, and operational events. The data includes monthly and weekly reporting fields as well as arrival and departure dates.

Key metrics used in this analysis include:

* Service
* Month
* Week
* Arrival Date
* Departure Date
* Available Beds
* Patient Requests
* Patients Admitted
* Patients Refused
* Admission Rate
* Refusal Rate
* Patient Satisfaction
* Staff Morale
* Event

## Data Cleaning and Limitations

Prior to analysis, the source tables were reviewed to understand the available fields, reporting periods, service categories, and relationships between the operational measures. The Month and Week fields were used for the reporting analysis, with the original Week field running continuously across the dataset rather than restarting for each month.

One limitation of the dataset is that Available Beds represents available bed observations rather than a clearly defined total hospital bed capacity. Because reliable total bed capacity was not available, a true occupancy rate could not be calculated. The reporting period is also limited, which restricts the ability to draw reliable long-term or year-over-year conclusions.

## Research Questions

How does available bed capacity vary across reporting periods?

How do admission and refusal rates change over time?

How do patient requests, admissions, and refusals vary by week?

How do admissions and patient requests vary across hospital services?

How does patient satisfaction vary across services?

How does staff morale vary across services?

## Methodology

The dataset was analysed in Tableau using monthly and weekly reporting fields to compare hospital operational performance across reporting periods and services. The analysis focused on patient requests, admitted patients, refused patients, available beds, admission rate, refusal rate, patient satisfaction, and staff morale.

Calculated fields, parameters, filters, dashboard actions, and LOD expressions were used to support the analysis. A reporting month parameter was created to allow users to select the month being analysed, while service-level charts were used to compare admissions and patient requests. Sparklines were also used to show changes in KPI values across the selected reporting period.

## Key Findings

### 1. Available Bed Levels Show Limited Variation

Available bed levels showed relatively limited variation across the analysed periods. In the selected view, available beds ranged from approximately 20 to 26.

The Available Beds KPI and sparkline were used to show both the current level of available beds and how the measure changes across the reporting period.

### 2. Admission and Refusal Rates Provide Different Views of Patient Flow

Admission and refusal rates provide complementary measures of how patient requests are handled. The Admission Rate measures the proportion of requests resulting in admissions, while the Refusal Rate measures the proportion of requests that were refused.

Displaying both measures together provides additional context compared with relying on admission rate alone and allows changes in patient flow to be compared over time.

### 3. Admissions and Patient Requests Vary Across Services

The number of admissions and patient requests varies across hospital services, indicating that patient demand and admission activity are not evenly distributed across the hospital.

Comparing these measures by service provides additional context when investigating differences in patient demand, admissions, and refusals.

### 4. Weekly Patient Flow Changes Throughout the Reporting Period

Weekly requests, admissions, and refusals were analysed together to identify changes in patient flow throughout the selected month. This provides additional context for the Admission Rate and Refusal Rate KPIs by showing the underlying activity contributing to the percentages.

### 5. Patient Satisfaction and Staff Morale Add Additional Context

Patient satisfaction and staff morale provide additional measures of hospital performance beyond patient demand and bed availability. Comparing these measures across services allows patient and staff experience to be considered alongside operational performance.

## Conclusion

This analysis shows that hospital operational performance varies across services and reporting periods. Available bed levels showed relatively limited variation, while patient requests and admissions differed across services.

Admission and refusal rates provide additional context for patient flow, while patient satisfaction and staff morale provide measures of patient and staff experience. Together, these measures provide a broader view of hospital operations than focusing on patient volume or bed availability alone.

## Recommended Next Steps

Investigate the relationship between available beds and refusal rates to determine whether lower bed availability is associated with a higher proportion of refused requests.

Analyse average patient length of stay using Arrival Date and Departure Date to better understand bed utilisation. Obtain reliable total bed capacity data to calculate a true occupancy rate.

Investigate whether operational events such as strikes and surgeries are associated with changes in admissions, refusals, patient satisfaction, or staff morale.

Analyse patient satisfaction and staff morale over a longer reporting period and compare performance across multiple years to identify seasonal and longer-term trends. 
