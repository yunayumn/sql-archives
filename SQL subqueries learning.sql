-- Using subquery in a SELECT statement

-- Compares the number of bikes available at a particular station to the overall average number of bukes available at all stations
SELECT
  station_id,
  num_bikes_available,
  -- This subquery means pulling data from a separate table as a new column
  (SELECT
    AVG(num_bikes_available)
  FROM `bigquery-public-data.new_york.citibike_stations`) AS avg_num_bikes_available
FROM
  `bigquery-public-data.new_york.citibike_stations`;

-- Using a subquery in a FROM statement

-- Calculate the total number of rides that started at each station over time
SELECT
  station_id,
  name,
  number_of_rides AS number_of_rides_starting_at_station
FROM
  (
  SELECT
    CAST(start_station_id AS STRING) AS start_station_id_str, #**
    COUNT(*) number_of_rides
  FROM
    `bigquery-public-data.new_york.citibike_trips`
    GROUP BY
    CAST(start_station_id AS STRING) #**
  )
INNER JOIN
  `bigquery-public-data.new_york.citibike_stations`
ON
  station_id = start_station_id_str #**
ORDER BY
  number_of_rides DESC;

-- Using a subquery in a WHERE statement

-- List of stations subscribers used
SELECT
	station_id,
	name
FROM
	`bigquery-public-data.new_york.citibike_stations`
WHERE
	station_id IN
	(
		SELECT
			CAST(start_station_id AS STRING) AS start_station_id_str #**
		FROM
	    	`bigquery-public-data.new_york.citibike_trips`
	  	WHERE
			usertype = 'Subscriber'
  	);