CREATE TABLE tab
(
    `machine_id` UInt64,
    `name` String,
    `timestamp` DateTime
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(timestamp)
ORDER BY machine_id;
SELECT
  toStartOfInterval(timestamp, INTERVAL 300 SECOND) AS ts
FROM tab
WHERE ts > '2022-11-24 11:19:00'
GROUP BY ts;
