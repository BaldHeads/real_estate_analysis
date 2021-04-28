--csv files must be given read access to the users group in Windows 10

-- Copy into Regions Table
COPY regions(region_id, region_type, region)
FROM 'C:\Users\akgoel\Documents\fintech\miniature-enigma\schema\ZILLOW_REGIONS.csv'
DELIMITER ','
CSV HEADER;

--Copy into Indicators Table
COPY indicators(indicator_id, indicator, category)
FROM 'C:\Users\akgoel\Documents\fintech\miniature-enigma\schema\ZILLOW_INDICATORS.csv'
DELIMITER ','
CSV HEADER;