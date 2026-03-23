CREATE TABLE test_generic_events_all
(
    APIKey UInt8,
    SessionType UInt8
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY APIKey;

INSERT INTO test_generic_events_all;

SELECT OperatingSystem
FROM test_generic_events_all
PREWHERE APIKey = 42
WHERE SessionType = 42;

SELECT *
FROM test_generic_events_all
PREWHERE APIKey = 42
WHERE SessionType = 42;

SELECT *
FROM test_generic_events_all
WHERE APIKey = 42
    AND SessionType = 42;

SELECT OperatingSystem
FROM test_generic_events_all
WHERE APIKey = 42;

SELECT OperatingSystem
FROM test_generic_events_all
WHERE APIKey = 42
    AND SessionType = 42;