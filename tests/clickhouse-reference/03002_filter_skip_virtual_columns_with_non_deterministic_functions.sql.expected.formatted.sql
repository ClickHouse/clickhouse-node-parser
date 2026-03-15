-- Tags: long
SET max_rows_to_read = 0;

CREATE TABLE test
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

SELECT ignore(number)
FROM test
WHERE RAND() > 4292390314
LIMIT 10;

SELECT count() > 0
FROM test
WHERE RAND() > 4292390314;