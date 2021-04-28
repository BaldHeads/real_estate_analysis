--CREATE DATABASE zillow
--    WITH 
--    OWNER = postgres
--    ENCODING = 'UTF8'
--    CONNECTION LIMIT = -1;



DROP TABLE IF EXISTS regions CASCADE;
DROP TABLE IF EXISTS indicators CASCADE;
DROP TABLE IF EXISTS zillow_data CASCADE;

CREATE TABLE regions (
    region_id INTEGER,
    region_type VARCHAR(10),
    region VARCHAR(100),
    PRIMARY KEY (region_id)
);

CREATE TABLE indicators (
    indicator_id CHAR(4),
    indicator VARCHAR(100),
    category VARCHAR(20),
    PRIMARY KEY (indicator_id)

);

CREATE TABLE zillow_data (
    indicator_id CHAR(4),
    region_id INTEGER,
    date DATE,
    avg_value REAL,
    FOREIGN KEY (indicator_id) REFERENCES indicators(indicator_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);