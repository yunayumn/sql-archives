-- Load first 1000 rows from the county_natality table
SELECT
  *
FROM
  `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality`
LIMIT
  1000;

-- Use ORDER BY to sort relevant data
SELECT
  *
FROM
  `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality`
ORDER BY --This is a SQL sort order function
  Births DESC --Applies sorting to the Births column
LIMIT
  10;

-- Condition 1: Results from Erie, Niagara, and Chautauqua counties in New York state
-- Condition 2: Results ordered by county of residence and year to find the trend

SELECT
  *
FROM
 `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality`
WHERE
  County_of_Residence = 'Erie County, NY'
  OR County_of_Residence = 'Niagara County, NY'
  OR County_of_Residence = 'Chautauqua County, NY'
ORDER BY
  County_of_Residence,
  Births DESC;