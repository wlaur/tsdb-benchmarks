-- pymonetdb does not fetch JSON columns correctly, cast to string to match e.g. duckdb
SELECT
  order_id,
  counter,
  event_created,
  event_type,
  satisfaction,
  processor,
  backup_processor,
  cast(event_payload as text) as event_payload
FROM
  order_events
WHERE
  event_created >= '2024-01-01 00:00:00'
  and event_created < '2024-01-01 23:55:00'
  AND order_id = 512
ORDER BY
  event_created;
