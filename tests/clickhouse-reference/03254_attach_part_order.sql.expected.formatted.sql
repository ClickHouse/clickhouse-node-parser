CREATE TABLE test_table
(
    dt DateTime,
    id UInt32,
    url String,
    visits UInt32
)
ENGINE = ReplacingMergeTree
ORDER BY (dt, id)
PARTITION BY toYYYYMM(dt);

SELECT
    id,
    visits
FROM test_table FINAL
ORDER BY id ASC
FORMAT Vertical;