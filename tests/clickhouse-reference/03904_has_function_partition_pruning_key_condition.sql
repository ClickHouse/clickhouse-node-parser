CREATE TABLE test
(
    dt DateTime
)
ENGINE = MergeTree
PARTITION BY toDate(dt)
ORDER BY tuple()
SETTINGS index_granularity = 1;
INSERT INTO test
SELECT toDateTime('2026-01-01 00:00:00') + number * 3600
FROM numbers(24 * 40);
SELECT count()
FROM test
WHERE has([toDateTime('2026-01-10 00:00:00')], dt);
SELECT count()
FROM test
WHERE NOT has([toDateTime('2026-01-10 00:00:00')], dt);
