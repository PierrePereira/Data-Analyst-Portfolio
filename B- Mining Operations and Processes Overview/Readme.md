# Mining Process Performance Analysis

[Download Mining Process Performance Dashboard](https://github.com/PierrePereira/Data-Analyst-Portfolio/raw/refs/heads/master/B-%20Mining%20Operations%20and%20Processes%20Overview/Excel%20Dashboard%20Mining%20Operations%20and%20Processes%20Overview%20.xlsx)

## Project Overview

This project uses **Excel, Power Query, Power Pivot, and DAX** to analyse operational data from an iron ore flotation plant. The analysis examines the relationship between feed characteristics, reagent usage, pulp conditions, and flotation-column operating variables and their association with **Iron Concentrate % and Silica Concentrate %**. The purpose of this analysis is to identify key patterns in flotation performance and generate insights that could support further investigation into improving concentrate quality.

## Data Overview

The dataset contains **737,453 operational observations across 24 columns**, containing metrics from an iron ore flotation process. The data includes feed characteristics, flows, pulp conditions, and operating measurements from seven flotation columns, alongside the resulting iron and silica concentrate percentages.

Key metrics used in this analysis include:

* Iron Feed %
* Silica Feed %
* Starch Flow
* Amine Flow
* Ore Pulp Flow
* Ore Pulp pH
* Ore Pulp Density
* Air Flow across seven flotation columns
* Level across seven flotation columns
* Iron Concentrate %
* Silica Concentrate %

## Data Cleaning and Limitations

Prior to analysis, the dataset was reviewed for duplicate records, missing values, inconsistent values, and invalid numerical measurements.  No null, blank, or negative values were identified during the cleaning process.

A limitation of the analysis is that the dataset contains observational process data, meaning relationships between indivisual operating variables and concentrate quality should not be interpreted as causal. Several process variables can also change simultaneously, making it difficult to isolate the effect of an individual operating condition without further experimental analysis.

## Research Questions

How does iron concentrate quality vary across different operating conditions?

How does silica concentrate quality vary across different operating conditions?

How does feed composition relate to final concentrate quality?

How do starch and amine flows relate to concentrate quality?

How do pulp flow, pH, and density relate to iron and silica concentrate percentages?

How do air flow and column levels across the seven flotation columns relate to concentrate quality?

## Methodology

The dataset was cleaned and transformed using **Power Query** before being loaded into **Power Pivot.** DAX measures were then created to calculate key metrics and support the analysis, focusing on comparing operational variables with Iron Concentrate % and Silica Concentrate % to identify patterns in flotation performance.

Feed characteristics, usage, pulp conditions, and flotation-column measurements were then analysed against concentrate quality. The variables were examined together rather than treating any single process variable as the sole explanation for changes in concentrate quality.

## Key Findings

### 1. Concentrate Quality Varies Across Operating Conditions

The analysis showed differences in Iron Concentrate % and Silica Concentrate % across different operating conditions. Changes in feed characteristics, reagent flows, pulp conditions, and flotation-column measurements were associated with differences in final concentrate quality.

This suggests that flotation performance is influenced by a combination of operating conditions rather than a single process variable. Further analysis would be required to determine which variables have the strongest independent relationship with concentrate quality.

### 2. Feed Composition Is Important When Evaluating Flotation Performance

Iron Feed % and Silica Feed % were analysed alongside the resulting concentrate measurements to understand how the material entering the flotation process relates to final output quality.

Differences in feed composition were associated with differences in concentrate quality. This means that changes in the incoming material should be considered when evaluating plant performance, as variations in feed quality may influence the final concentrate independently of changes to the flotation process.

### 3. Reagent Flows Are Associated with Concentrate Quality

Starch and amine flows were analysed to investigate their relationship with Iron Concentrate % and Silica Concentrate %. The analysis showed variation in concentrate quality across different reagent operating conditions.

However, reagent usage cannot be considered independently from other process variables. Changes in reagent flows may occur alongside changes in feed composition, pulp conditions, and flotation-column settings, making further analysis necessary to determine the underlying relationships.

### 4. Pulp Conditions Are Associated with Flotation Performance

Ore Pulp Flow, Ore Pulp pH, and Ore Pulp Density were examined to investigate their relationship with concentrate quality. Differences in these operating conditions were associated with changes in Iron Concentrate % and Silica Concentrate %.

These results suggest that maintaining appropriate pulp conditions is an important part of flotation performance. However, the observational nature of the data means that further analysis would be required before determining whether changes to these variables directly cause changes in concentrate quality.

### 5. Flotation Column Conditions Vary Across the Process

Air flow and level measurements from the seven flotation columns were analysed to investigate differences in operating conditions throughout the flotation process.

The analysis showed variation in column operating conditions alongside differences in concentrate quality. This provides an opportunity for further investigation into whether specific column operating ranges are consistently associated with improved iron concentrate quality or reduced silica contamination.

## Conclusion

This analysis shows that iron flotation performance varies across feed characteristics, usage, pulp conditions, and flotation-column operating variables. The results suggest that concentrate quality is influenced by multiple interacting process conditions rather than a single factor.


## Recommended Next Steps

Investigate the interaction between feed composition, reagent flows, and pulp conditions to identify combinations of operating conditions associated with higher Iron Concentrate % and lower Silica Concentrate %.

Conduct statistical analysis to determine the strength of the relationships between individual process variables and concentrate quality while controlling for other operating conditions.

Develop predictive models to estimate Iron Concentrate % and Silica Concentrate % using feed characteristics, reagent flows, pulp conditions, and flotation-column measurements.

Investigate if specific operating ranges for the seven flotation columns are consistently associated with improved concentrate quality and whether these relationships change under different feed conditions.
