CREATE TABLE test
(
    dt DateTime
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toDate(dt)
SETTINGS index_granularity = 1;

SELECT count()
FROM test
WHERE has([toDateTime('2026-01-10 00:00:00')], dt);

SELECT count()
FROM test
WHERE NOT has([toDateTime('2026-01-10 00:00:00')], dt);