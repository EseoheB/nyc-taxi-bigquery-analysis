-- Q1: How did yellow taxi demand and revenue change across 2015?
-- Author: Haonan Zhang
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  EXTRACT(MONTH FROM pickup_datetime) AS trip_month,
  COUNT(*) AS trip_count,
  ROUND(SUM(total_amount), 2) AS total_revenue,
  ROUND(AVG(total_amount), 2) AS avg_trip_total
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE pickup_datetime IS NOT NULL AND total_amount > 0
GROUP BY trip_month
ORDER BY trip_month;
