-- This is a SQL lesson for working with strings and substrings in a database

-- Grab customer ID for customers who live in Ohio
SELECT
  DISTINCT customer_id
FROM
  `coursera-projects-456814.customer_data.customer_address` 
WHERE
  state = 'OH';

-- Check country length
SELECT
  LENGTH(country)
FROM
  `coursera-projects-456814.customer_data.customer_address`;

-- Check country length with more than 2 characters
SELECT
  country
FROM
  `coursera-projects-456814.customer_data.customer_address`
WHERE
  LENGTH(country) > 2;

-- Grab customer id of customer who live in US
SELECT
  DISTINCT customer_id
FROM
  `coursera-projects-456814.customer_data.customer_address`
WHERE
  SUBSTR(country, 1, 2) = 'US';

-- Grab state id with more than two letters
SELECT
  state
FROM
  `coursera-projects-456814.customer_data.customer_address`
WHERE
  LENGTH(state) > 2;

-- Grab customer ID for customers who live in Ohio (with corrected extra space after 'OH')
SELECT
  DISTINCT customer_id
FROM
  `coursera-projects-456814.customer_data.customer_address` 
WHERE
  TRIM(state) = 'OH';