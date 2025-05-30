-- Subquery to find the average trip  duration by station
SELECT
  subquery.start_station_id,
  subquery.avg_duration
FROM
  (
  SELECT
  trips.start_station_id,
  AVG(trips.tripduration) AS avg_duration
  FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` AS trips
    group by trips.start_station_id
  ) AS subquery
ORDER BY avg_duration DESC;

-- Subquery to compare trip duration by station
SELECT
  starttime,
  start_station_id,
  tripduration,
  (
    SELECT ROUND(AVG(tripduration),2)
    FROM bigquery-public-data.new_york_citibike.citibike_trips AS trips
    WHERE start_station_id = outer_trips.start_station_id
  ) AS avg_duration_for_station,
    ROUND(tripduration - (
        SELECT AVG(tripduration)
        FROM bigquery-public-data.new_york_citibike.citibike_trips
        WHERE start_station_id = outer_trips.start_station_id), 2) AS difference_from_avg
FROM bigquery-public-data.new_york_citibike.citibike_trips AS outer_trips
ORDER BY difference_from_avg DESC
LIMIT 25;

-- Subquery to determine the five stations with the longest mean trip duration
SELECT
    tripduration,
    start_station_id
FROM bigquery-public-data.new_york_citibike.citibike_trips
WHERE start_station_id IN
    (
        SELECT
            start_station_id
        FROM
        (
            SELECT
                start_station_id,
                AVG(tripduration) AS avg_duration
            FROM bigquery-public-data.new_york_citibike.citibike_trips
            GROUP BY start_station_id
        ) AS top_five
        ORDER BY avg_duration DESC
        LIMIT 5
    );