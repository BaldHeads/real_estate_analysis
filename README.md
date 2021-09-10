# Texas Real Estate Analysis

A project to see if we can correlate house prices to local income levels.

General Findings:
 - mostly higher relative opportunity ratios in DFW area 
 - income & property values (including rent) appear to have a positive correlation
 - 2012 was the best year to buy houses

 
Subtasks:

 1. SQL query for data file size reduction & narrowing scope to Texas
     * [Database Creation and Schema](schema/schema.sql)
     * [Zillow Data Import](schema/seed.sql) - The Zillow CSV was 3.7 GB, so I had to split the CSV into 5 files to get under the pgAdmin limit of 1 GB per file
         * ZALL - Category includes all single-family house, and condos
         * ZCON - Category for just condos
         * RSNA - Category for rentals
     * [Queries](schema/queries.sql) - Shows the various queries used to limit data to Texas and the 5 city Zip Codes

 2. Pandas data cleanup

 3. [Pandas merging data](notebooks/ankur.ipynb)

 4. [Opportunity Ratio calculation](jordan.ipynb)

 5. [Static plots and mapbox animation](notebooks/ahsan.ipynb)

 6. Choropleths
     * [ZALL for 4 Cities](notebooks/chloro-zall.ipynb)
     * [ZCON for 4 Cities](notebooks/chloro-zcon.ipynb)
     * [RSNA for 4 Cities](notebooks/chloro-rental.ipynb)

 7. [Dashboard app & visualization cosmetics](presentation/dashboard_template.ipynb)


 
