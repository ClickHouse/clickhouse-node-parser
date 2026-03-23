CREATE TABLE test
(
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO test SELECT 'str'
FROM numbers(1);

SELECT *
FROM test;