DROP TABLE IF EXISTS table_with_pk_clear;

CREATE TABLE table_with_pk_clear
(
    key1 UInt64,
    key2 String,
    value1 String,
    value2 String
)
ENGINE = MergeTree()
ORDER BY (key1, key2);

INSERT INTO table_with_pk_clear SELECT
    number,
    number * number,
    toString(number),
    toString(number * number)
FROM numbers(1000);

SELECT countDistinct(key1)
FROM table_with_pk_clear;

SELECT countDistinct(key2)
FROM table_with_pk_clear;