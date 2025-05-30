-- Query is used to load a table by creating a new version of it in another folder
SELECT
  stn,
  date,
  IF(
      temp=9999.9,
      NULL,
      temp) AS temperature,
  IF(
    wdsp ="999.9",
    NULL,
    CAST(wdsp AS FLOAT64)) AS wind_speed,
  IF(
    prcp=99.99,
    0,
    prcp) AS precipitation,

FROM
  `bigquery-public-data.noaa_gsod.gsod2020`

WHERE
  stn="725030" -- La Guardia
  OR stn="744860" -- JFK

ORDER BY
  date DESC,
  stn ASC;

-- Search for the average temperature at the JFK and La Guardia weather stations between June 1, 2020 and June 30, 2020
SELECT
  AVG(temperature)
FROM
  `coursera-projects-456814.demos.nyc_weather`
WHERE
  date BETWEEN '2020-06-01' AND '2020-06-30'