SELECT
  order_id,
  count(*) as count
FROM
  order_events
WHERE
  event_created >= '2024-01-29'
  and event_created < '2024-02-05'
  AND has(
    JSONExtract(event_payload, 'status', 'Array(Nullable(TEXT))'),
    'Delayed'
  )
GROUP BY
  order_id
ORDER BY
  count,
  order_id desc
limit
  1;
