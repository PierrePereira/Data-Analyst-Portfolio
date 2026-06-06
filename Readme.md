# Carbon Emissions EDA

## Project Overview

Vehicle emissions are a major contributor to greenhouse gas emissions. Understanding the factors        associated with higher CO2 emissions can help identify trends in vehicle efficiency and the impact  vehicles have on the environment.

This Project uses SQL  to explore the Co2 emissions of Vehicles between the years 2017-2025; and how they vary across manafacturer, model, Year, and  engine specifications. It comapares emissions across four fuel types (Premium, Midgrade, Regular, Diesel). This analysis also examines the relationship between fuel economy(MPG) and emissions, & if there are any changes in emission trends over time.

The purpose of this analysis is to identify key factors that are associated with  vehicle emissions and generate insights that could support further research into vehicle efficiency and reducing emissions.

## Data Overiew

The dataset used contains information on internal combustion engine (ICE) vehicles and their environmental performance. The dataset includes vehicle specifications, fuel type, fuel economy, and CO2 emissions.

Key metrics used in this analysis include:

Make (Manufacturer)

Model

Model Year

Fuel Type

Engine Size (L)

Engine Cylinders

Transmission Type

Combined MPG (miles per gallon)

CO2 Emissions (grams per mile)


## Methodology

The dataset was fist filtered to include only internal combustion engine (ICE) vehicles. Initial analysis focused on comparing average CO2 emissions across manufacturers, vehicle models, and fuel types to identify broad emission patterns.

After observing differences in emissions between fuel types, further analysis was conducted on vehicle models that use multiple fuel types within the same model year and same model specification. This allowed for direct comparisons between fuel types while reducing the influence of differences in odel specification.

Additional vehicle characteristics, including engine cylinders, engine size, and transmission type, were then explored to determine whether they couldhelp explain observed differences in emissions and fuel economy (MPG) that could not be explained bby fuel type.

Finally, emission trends were analysed across model years to identify changes over time and investigate the relationship between fuel economy and CO2 emissions.