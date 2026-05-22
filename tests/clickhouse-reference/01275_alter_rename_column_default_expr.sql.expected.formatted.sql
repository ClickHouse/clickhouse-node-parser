DROP TABLE IF EXISTS table_for_rename;

CREATE TABLE table_for_rename
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String DEFAULT concat(value1, ' + ', value2)
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

ALTER TABLE table_for_rename RENAME COLUMN value1 TO value4;

ALTER TABLE table_for_rename RENAME COLUMN value2 TO value5;

SHOW CREATE TABLE table_for_rename;

INSERT INTO table_for_rename (date, key, value4, value5) SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1)
FROM numbers(10, 10);

ALTER TABLE table_for_rename RENAME COLUMN value4 TO value1;

ALTER TABLE table_for_rename RENAME COLUMN value5 TO value2;

INSERT INTO table_for_rename (date, key, value1, value2) SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1)
FROM numbers(20, 10);