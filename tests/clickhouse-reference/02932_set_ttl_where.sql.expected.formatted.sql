CREATE TABLE t_temp
(
    a UInt32,
    timestamp DateTime
)
ENGINE = MergeTree
ORDER BY a
TTL timestamp + toIntervalSecond(2) WHERE a IN (
    SELECT number
    FROM `system`.numbers
    LIMIT 10000
);

SELECT sleep(1);