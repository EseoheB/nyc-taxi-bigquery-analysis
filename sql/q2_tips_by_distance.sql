-- Q2: Do longer yellow taxi trips receive better tips?
-- Author: Haonan Zhang
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  CASE
    WHEN trip_distance < 1 THEN 'Short: Under 1 mile'
    WHEN trip_distance >= 1 AND trip_distance < 3 THEN 'Medium: 1-3 miles'
    WHEN trip_distance >= 3 AND trip_distance < 10 THEN 'Long: 3-10 miles'
    ELSE 'Very Long: 10+ miles'
  END AS distance_group,
  COUNT(*) AS trip_count,
  ROUND(AVG(trip_distance), 2) AS avg_distance,
  ROUND(AVG(tip_amount), 2) AS avg_tip,
  ROUND(AVG(total_amount), 2) AS avg_total_amount,
  ROUND(AVG(tip_amount / NULLIF(total_amount, 0)) * 100, 2) AS avg_tip_percentage
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE trip_distance > 0 AND total_amount > 0 AND tip_amount >= 0
GROUP BY distance_group
ORDER BY avg_distance;
