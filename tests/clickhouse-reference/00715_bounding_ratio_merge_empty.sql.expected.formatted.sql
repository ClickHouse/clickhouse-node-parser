CREATE TABLE rate_test
(
    timestamp UInt32,
    event UInt32
)
ENGINE = Memory;

CREATE TABLE rate_test2
(
    timestamp UInt32,
    event UInt32
)
ENGINE = Memory;

SELECT boundingRatioMerge(state)
FROM (
        SELECT boundingRatioState(timestamp, event) AS state
        FROM rate_test
        UNION ALL
        SELECT boundingRatioState(timestamp, event)
        FROM rate_test2
        WHERE 1 = 0
    );