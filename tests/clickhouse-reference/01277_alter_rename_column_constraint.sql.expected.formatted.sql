DROP TABLE IF EXISTS table_for_rename;

CREATE TABLE table_for_rename
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String,
    CONSTRAINT cs_value1 CHECK toInt64(value1) < toInt64(value2),
    CONSTRAINT cs_value2 CHECK toInt64(value2) < toInt64(value3)
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date;

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(9);

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number)
FROM numbers(9); --{serverError VIOLATED_CONSTRAINT}

SELECT *
FROM table_for_rename
ORDER BY key ASC;

ALTER TABLE table_for_rename RENAME COLUMN value1 TO value4;

ALTER TABLE table_for_rename RENAME COLUMN value2 TO value5;

SELECT '-- insert after rename --';

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(10, 10);

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number)
FROM numbers(10, 10); --{serverError VIOLATED_CONSTRAINT}

ALTER TABLE table_for_rename RENAME COLUMN value4 TO value1;

ALTER TABLE table_for_rename RENAME COLUMN value5 TO value2;

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(20, 10);

INSERT INTO table_for_rename SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number),
    toString(number + 2)
FROM numbers(20, 10); --{serverError VIOLATED_CONSTRAINT}