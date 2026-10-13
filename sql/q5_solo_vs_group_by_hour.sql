-- Q5: Which hours are most popular for solo vs group taxi trips?
-- Author: Jennifer Flora Bastian
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  EXTRACT(HOUR FROM pickup_datetime) AS hour,
  CASE
    WHEN passenger_count = 1 THEN 'Solo Rider'
    ELSE 'Group Rider'
  END AS rider_type,
  COUNT(*) AS trip_count,
  ROUND(AVG(fare_amount), 2) AS avg_fare
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE fare_amount > 0
  AND passenger_count BETWEEN 1 AND 6
GROUP BY hour, rider_type
ORDER BY hour, rider_type;
