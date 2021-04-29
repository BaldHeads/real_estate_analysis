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