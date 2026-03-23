CREATE TABLE test_datetime
(
    time DateTime
)
ENGINE = MergeTree
ORDER BY time
PARTITION BY time;

INSERT INTO test_datetime (time);

SELECT *
FROM test_datetime
WHERE time = toDate(18012);