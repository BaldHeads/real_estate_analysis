# miniature-enigma

A project to see if we can correlate house prices to local income levels.

General Findings:
 - mostly higher relative opportunity ratios in DFW area 
 - rent rates appear negatively related to property prices
 - income & property values (including rent) appear to have a positive correlation
 - 2012 was the best year to buy houses

 
 
 Summary of workload split:

Ankur

 1. SQL query for data file size reduction & narrowing scope to texas
     * [Database Creation and Schema](schema/schema.sql)
     * [Zillow Data Import](schema/seed.sql) - The Zillow CSV was 3.7 GB, so I had to split the CSV into 5 files to get under the pgAdmin limit of 1 GB per file
         * ZALL - Category includes all single-family house, and condos
         * ZCON - Category for just condos
         * RSNA - Category for rentals
     * [Queries](schema/queries.sql) - Shows the various queries used to limit data to Texas and the 5 city Zip Codes
 2. Pandas merging data
     * [Initial pandas Merge](notebooks/ankur.ipynb)
 3. Choropleths
     * [ZALL for 4 Cities](notebooks/chloro-zall.ipynb)
     * [ZCON for 4 Cities](notebooks/chloro-zcon.ipynb)
     * [RSNA for 4 Cities](notebooks/chloro-rental.ipynb)

Ahsan

 1. Pandas data cleanup
 2. [Static plots and mapbox animation](notebooks/ahsan.ipynb)

Jordan

 1. [Proposal](proposal.md)
 2. [Opportunity Ratio calculation](jordan.ipynb)
 3. [Dashboard app & visualization cosmetics](presentation/dashboard_template.ipynb)
 