CREATE TABLE sometable
(
    date Date,
    time Int64,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY time;

SELECT COUNT()
FROM sometable;