-- Searching for the most expensive purchase
SELECT
  purchase_price
FROM
  `coursera-projects-456814.customer_data.customer_purchase`
ORDER BY
  purchase_price DESC;

-- Using CAST function to sort wrongly formatted data
SELECT
  CAST(purchase_price AS FLOAT64)
FROM
  `coursera-projects-456814.customer_data.customer_purchase`
ORDER BY
  CAST(purchase_price AS FLOAT64) DESC;

-- Learning notes: Sometimes we query data without wanting to tinkering with the original data, so we use the CAST function

-- Grab the date and purchase prices between 1 December 2020 and 31 December 2020
SELECT
  date,
  purchase_price
FROM
  `coursera-projects-456814.customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31'; 

-- Using CAST function to reformat datetime format into showing date only
SELECT
  CAST(date as date) AS date_only,
  purchase_price
FROM
  `coursera-projects-456814.customer_data.customer_purchase`
WHERE
  date BETWEEN '2020-12-01' AND '2020-12-31';

-- Grabbing the product code and color column together as one single column for 'couch' product
SELECT
  CONCAT(product_code, product_color) AS new_product_code
FROM
  `coursera-projects-456814.customer_data.customer_purchase`
WHERE
  product = "couch";

-- COALESCE function works almost like the LOOKUP function in Excel/Sheets

-- Grab product name, but if it is null then grab the product code
SELECT
  COALESCE(product, product_code)
FROM
  `coursera-projects-456814.customer_data.customer_purchase`;