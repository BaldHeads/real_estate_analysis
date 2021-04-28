# Project Proposal

## Project Title: Miniature Enigma

## Team Members: Ankur, Ahsan, Jordan

## Project Idea:

Real Estate: 
Identify growing,overvalued, and undervalued areas in
houston-austin-dallas

## Outline/description
We will be combining historical Zillow real estate data and historical IRS Income data by zip code to ID areas with undervalued and overvalued properties

The focus will be on Houston-Dallas-Austin

## Research questions to answer
Is there a pattern in the amount of time it takes for an undervalued area to equalize?

Does one city typically have more undervalued areas?

Are certain types of properties more likely to be over or undervalued?

## Datasets to be used
Quandl zillow real estate data

IRS income data by zip code for TX

## Rough breakdown of tasks
1. For all tx zips, get salary data & zillow home price data
2. Pick salary data columns we will use (zip codes, AGI, total income)
    - Need to add a year column for each file
3. Make both datasets database/pandas ready
4. Pandas
    - Clean and concatenate data in a useful manner
    - Pick useful statistics to start determining zones for comparison of salary:real_estate ratios 
5. Plots
    - Box and whisker


