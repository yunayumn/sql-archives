-- Data cleaning

-- Grabbing the unique fuel type
SELECT 
  DISTINCT fuel_type
FROM
  `coursera-projects-456814.cars.car_info`
LIMIT 1000;

-- Inspect the length column
SELECT 
  MIN(length) AS min_length,
  MAX(length) AS max_length
FROM
  `coursera-projects-456814.cars.car_info`;

-- Fill in missing data

-- Check for missing values in number of doors
SELECT
  *
FROM
  `coursera-projects-456814.cars.car_info`
WHERE
  num_of_doors IS NULL;

-- Update table so all Dodge gas sedans have four doors
UPDATE
  `coursera-projects-456814.cars.car_info`
SET
  num_of_doors = "four"
WHERE 
  make = "dodge"
  AND fuel_type = "gas"
  AND body_style = "sedan";

-- Making sure the table is updated properly
SELECT
  *
FROM
  `coursera-projects-456814.cars.car_info`
WHERE
  num_of_doors IS NULL;

-- Update table so all Mazda diesel sedans have four doors
UPDATE
  `coursera-projects-456814.cars.car_info`
SET
  num_of_doors = "four"
WHERE 
  make = "mazda"
  AND fuel_type = "diesel"
  AND body_style = "sedan";

-- Making sure the table is updated properly
SELECT
  *
FROM
  `coursera-projects-456814.cars.car_info`
WHERE
  num_of_doors IS NULL;

-- Check unique number of cylinders
SELECT
  DISTINCT num_of_cylinders
FROM
  `coursera-projects-456814.cars.car_info`;

-- Correct the typo from tow to two
UPDATE
  `coursera-projects-456814.cars.car_info`
SET
  num_of_cylinders = "two"
WHERE
  num_of_cylinders = "tow";

-- Making sure the table is updated properly again
SELECT
  DISTINCT num_of_cylinders
FROM
  `coursera-projects-456814.cars.car_info`;

-- Check compression ratio data
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  `coursera-projects-456814.cars.car_info`;

-- Check for compression ratio range in the table
SELECT
  MIN(compression_ratio) AS min_compression_ratio,
  MAX(compression_ratio) AS max_compression_ratio
FROM
  `coursera-projects-456814.cars.car_info`
WHERE
  compression_ratio <> 70;

-- Check how much rows contain the wrong value
SELECT
  COUNT(*) AS num_of_rows_to_delete
FROM
  `coursera-projects-456814.cars.car_info`
WHERE
  compression_ratio = 70;

-- Correct the wrong data value
DELETE
  `coursera-projects-456814.cars.car_info`
WHERE
  compression_ratio = 70;

-- Check for inconsistencies that might cause errors
SELECT
  DISTINCT drive_wheels
FROM
  `coursera-projects-456814.cars.car_info`;

-- Check string length for drive wheels
SELECT
  DISTINCT drive_wheels,
  LENGTH(drive_wheels) AS string_length
FROM
  `coursera-projects-456814.cars.car_info`;

-- Remove extra spaces in drive wheels
UPDATE
  `coursera-projects-456814.cars.car_info`
SET
  drive_wheels = TRIM(drive_wheels)
WHERE
  TRUE;

-- Ensure that there are only three distict values in drive wheels
SELECT
  DISTINCT drive_wheels
FROM
  `coursera-projects-456814.cars.car_info`;