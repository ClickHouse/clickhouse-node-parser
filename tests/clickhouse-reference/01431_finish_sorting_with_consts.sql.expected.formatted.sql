CREATE TABLE pk_func
(
    d DateTime,
    ui UInt32
)
ENGINE = MergeTree
ORDER BY toDate(d);

SELECT
    1,
    *
FROM pk_func
ORDER BY
    toDate(d) ASC,
    ui ASC
LIMIT 3;