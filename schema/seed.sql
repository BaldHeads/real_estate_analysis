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

COPY zillow_data(indicator_id, region_id, date, avg_value)
FROM 'E:\Users\akgoel\Downloads\ZILLOW_DATA\ZILLOW_DATA-004.csv'
DELIMITER ','
CSV HEADER;

COPY zillow_data(indicator_id, region_id, date, avg_value)
FROM 'E:\Users\akgoel\Downloads\ZILLOW_DATA\ZILLOW_DATA-003.csv'
DELIMITER ','
CSV HEADER;

COPY zillow_data(indicator_id, region_id, date, avg_value)
FROM 'E:\Users\akgoel\Downloads\ZILLOW_DATA\ZILLOW_DATA-002.csv'
DELIMITER ','
CSV HEADER;

COPY zillow_data(indicator_id, region_id, date, avg_value)
FROM 'E:\Users\akgoel\Downloads\ZILLOW_DATA\ZILLOW_DATA-001.csv'
DELIMITER ','
CSV HEADER;

COPY zillow_data(indicator_id, region_id, date, avg_value)
FROM 'E:\Users\akgoel\Downloads\ZILLOW_DATA\ZILLOW_DATA-000.csv'
DELIMITER ','
CSV HEADER;


--Copy Zip Code Data
COPY zip_zone(zipcode, city)
FROM 'C:\Users\akgoel\Documents\fintech\miniature-enigma\schema\zipcode_zone.csv'
DELIMITER ','
CSV HEADER;