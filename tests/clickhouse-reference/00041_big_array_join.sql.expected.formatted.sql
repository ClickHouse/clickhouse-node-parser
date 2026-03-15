CREATE TABLE big_array
(
    x Array(UInt8)
)
ENGINE = TinyLog;

SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

SELECT count()
FROM
    big_array
ARRAY JOIN x;

SELECT count()
FROM
    big_array
ARRAY JOIN x AS y;

SELECT
    countIf(has(x, 10)),
    sum(y)
FROM
    big_array
ARRAY JOIN x AS y;

SELECT countIf(has(x, 10))
FROM
    big_array
ARRAY JOIN x AS y;

SELECT
    countIf(has(x, 10)),
    sum(y)
FROM
    big_array
ARRAY JOIN x AS y
WHERE 1;

SELECT countIf(has(x, 10))
FROM
    big_array
ARRAY JOIN x AS y
WHERE 1;

SELECT
    countIf(has(x, 10)),
    sum(y)
FROM
    big_array
ARRAY JOIN x AS y
WHERE has(x, 15);