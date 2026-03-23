SYSTEM DROP  TABLE IF EXISTS table_for_rename;

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