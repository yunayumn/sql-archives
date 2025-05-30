-- HOW TO USE SQL JOINS?

-- First select the columns to show
SELECT
  edu.country_name,
  summary.country_code,
  edu.value
-- Then from the left table
FROM
  `bigquery-public-data.world_bank_intl_education.international_education` AS edu
-- Join with the right table (choose the type of join here from RIGHT JOIN, LEFT JOIN, INNER JOIN, and FULL OUTER JOIN)
INNER JOIN
  `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
-- Don't forget to add AS for aliasing and use an alias that is short to make things easier

-- Then on the primary and foreign key that brings them together (in this case is country_code)
ON edu.country_code = summary.country_code;

-- Use JOIN to answer a question

-- Additional tasks:
-- 1. Exclude rows with a missing region (INNER JOIN)
-- 2. Use the SUM(value) to calculate the total population for a given grain size
-- 3. Sort by highest population region first (ORDER BY)

-- Query:
SELECT
  summary.region,
  SUM(edu.value) secondary_edu_population
FROM
  `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN
  `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
ON edu.country_code = summary.country_code
  WHERE summary.region IS NOT NULL
  AND edu.indicator_name = 'Population of the official age for secondary education, both sexes (number)'
  AND edu.year = 2015
GROUP BY summary.region
ORDER BY secondary_edu_population DESC;

-- Using LEFT JOIN

-- Task:
-- 1. Join the statistics from teams table with mascots information table
-- 2. LEFT JOIN is used because not all teams have mascots, INNER JOIN would exclude teams with no mascot

-- Query:
SELECT
  seasons.market AS university,
  seasons.name AS team_name,
  mascots.mascot AS team_mascot,
  AVG(seasons.wins) AS avg_wins,
  AVG(seasons.losses) AS avg_losses,
  AVG(seasons.ties) AS avg_ties
FROM
  `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
LEFT JOIN
  `bigquery-public-data.ncaa_basketball.mascots` AS mascots
ON seasons.team_id = mascots.id
WHERE seasons.season BETWEEN 1990 AND 1999
  AND seasons.division = 1
  GROUP BY 1,2,3
ORDER BY  avg_wins DESC, university;

-- What if we use INNER JOIN?
SELECT
  seasons.market AS university,
  seasons.name AS team_name,
  mascots.mascot AS team_mascot,
  AVG(seasons.wins) AS avg_wins,
  AVG(seasons.losses) AS avg_losses,
  AVG(seasons.ties) AS avg_ties
FROM
  `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
INNER JOIN
  `bigquery-public-data.ncaa_basketball.mascots` AS mascots
ON seasons.team_id = mascots.id
WHERE seasons.season BETWEEN 1990 AND 1999
  AND seasons.division = 1
  GROUP BY 1,2,3
ORDER BY  avg_wins DESC, university;