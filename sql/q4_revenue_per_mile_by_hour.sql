-- Q4: When are taxi trips most profitable per mile?
-- Author: Rabiat Blessing Ibrahim
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  EXTRACT(HOUR FROM pickup_datetime) AS hour,
  COUNT(*) AS trip_count,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(AVG(trip_distance), 2) AS avg_distance,
  ROUND(AVG(fare_amount / trip_distance), 2) AS avg_fare_per_mile,
  ROUND(SUM(fare_amount) / SUM(trip_distance), 2) AS revenue_per_mile
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE fare_amount > 0
  AND trip_distance > 0
  AND trip_distance <= 50
GROUP BY hour
ORDER BY hour;
