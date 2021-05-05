--Which indicators are commonly used for zip code 77479 (Sugar Land):
select distinct indicator_id from zillow_data where region_id = 91968;
--Returns:
--"RSNA"
--"RSSA"
--"Z1BR"
--"Z2BR"
--"Z3BR"
--"Z4BR"
--"Z5BR"
--"ZALL"
--"ZCON"
--"ZSFH"

--Get time series data for all zips with "TX" in the region field
SELECT z.date, r.region, z.avg_value FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
WHERE r.region LIKE '%TX%' 
	AND r.region_type='zip'
	AND z.indicator_id='ZALL'
ORDER BY r.region, z.date

--This query does not return 77479
 SELECT * FROM regions WHERE region LIKE '%TX%Houston%' and region_type='zip' ORDER BY region

 --This query gets all zipcodes with TX in the region 
 SELECT count(*) FROM zillow_data as z INNER JOIN regions as r ON r.region_id=z.region_id WHERE r.region LIKE '%TX%' and r.region_type='zip'


--This query gets everything but the city column, *almost there*
SELECT z.date, r.region, z.avg_value, zipcode FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
    INNER JOIN (SELECT zipcode FROM zip_zone) as zip
    ON r.region LIKE CAST (zipcode AS VARCHAR) || '%'
WHERE r.region_type='zip'
	AND z.indicator_id='ZALL'
ORDER BY r.region, z.date

--This seems to be the query we need
SELECT z.date, r.region, z.avg_value, zip_zone.zipcode, zip_zone.city FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
    INNER JOIN (SELECT zipcode FROM zip_zone) as zip
    ON r.region LIKE CAST (zipcode AS VARCHAR) || '%'
	INNER JOIN zip_zone
	ON zip.zipcode=zip_zone.zipcode
WHERE r.region_type='zip'
	AND z.indicator_id='ZALL'
ORDER BY r.region, z.date

SELECT z.date, r.region, z.avg_value, zip_zone.zipcode, zip_zone.city FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
    INNER JOIN (SELECT zipcode FROM zip_zone) as zip
    ON r.region LIKE CAST (zipcode AS VARCHAR) || '%'
	INNER JOIN zip_zone
	ON zip.zipcode=zip_zone.zipcode
WHERE r.region_type='zip'
	AND z.indicator_id='RSNA'
ORDER BY r.region, z.date

SELECT z.date, r.region, z.avg_value, zip_zone.zipcode, zip_zone.city FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
    INNER JOIN (SELECT zipcode FROM zip_zone) as zip
    ON r.region LIKE CAST (zipcode AS VARCHAR) || '%'
	INNER JOIN zip_zone
	ON zip.zipcode=zip_zone.zipcode
WHERE r.region_type='zip'
	AND z.indicator_id='ZCON'
ORDER BY r.region, z.date

--Citywide metro queries
SELECT * FROM regions WHERE region_type='metro' AND region LIKE '%TX'
--THIS RETURNS:
--region_id region_type region
--394514	"metro"	"Dallas-Fort Worth, TX"
--394692	"metro"	"Houston, TX"
--395055	"metro"	"San Antonio, TX"
--394355	"metro"	"Austin, TX"

SELECT z.date, r.region, z.avg_value FROM zillow_data AS z 
	INNER JOIN regions AS r 
	ON r.region_id=z.region_id 
WHERE (r.region_id=394514
		OR r.region_id=394692
		OR r.region_id=395055
		OR r.region_id=394355)
	AND z.indicator_id='ZALL'
ORDER BY r.region, z.date