-- Q6: How do weekday and weekend taxi trips differ in fare, distance, and tipping?
-- Author: Jennifer Flora Bastian
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM pickup_datetime) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  COUNT(*) AS trip_count,
  ROUND(AVG(trip_distance), 2) AS avg_distance,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(AVG(tip_amount), 2) AS avg_tip
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE fare_amount > 0
  AND trip_distance > 0
  AND trip_distance <= 50
GROUP BY day_type
ORDER BY day_type;
