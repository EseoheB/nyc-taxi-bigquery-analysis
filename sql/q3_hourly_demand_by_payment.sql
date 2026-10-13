-- Q3: Do credit card and cash passengers behave differently across hours of the day?
-- Author: Rabiat Blessing Ibrahim
-- Dataset: bigquery-public-data.new_york.tlc_yellow_trips_2015

SELECT
  EXTRACT(HOUR FROM pickup_datetime) AS hour,
  payment_type,
  COUNT(*) AS trip_count,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(AVG(tip_amount), 2) AS avg_tip
FROM `bigquery-public-data.new_york.tlc_yellow_trips_2015`
WHERE fare_amount > 0 AND payment_type IN ('1', '2')
GROUP BY hour, payment_type
ORDER BY hour, payment_type;
