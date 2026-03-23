DROP TABLE IF EXISTS table_for_rename;

CREATE TABLE table_for_rename
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String MATERIALIZED concat(value1, ' + ', value2)
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date;

INSERT INTO table_for_rename (date, key, value1, value2) SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1)
FROM numbers(9);

SELECT *
FROM table_for_rename
ORDER BY key ASC;

SELECT '-- insert after rename --';

INSERT INTO table_for_rename (date, key, value4, value5) SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1)
FROM numbers(10, 10);

INSERT INTO table_for_rename (date, key, value1, value2) SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1)
FROM numbers(20, 10);