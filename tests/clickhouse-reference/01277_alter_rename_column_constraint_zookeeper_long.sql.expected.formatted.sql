-- Tags: long, zookeeper
SYSTEM DROP  TABLE IF EXISTS table_for_rename1;

CREATE TABLE table_for_rename1
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String,
    CONSTRAINT cs_value1 CHECK toInt64(value1) < toInt64(value2),
    CONSTRAINT cs_value2 CHECK toInt64(value2) < toInt64(value3)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01277/test_for_rename', '1')
ORDER BY key
PARTITION BY date;

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(9);

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number)
FROM numbers(9);

SELECT *
FROM table_for_rename1
ORDER BY key ASC;

SELECT '-- insert after rename --';

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(10, 10);

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number)
FROM numbers(10, 10);

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number + 1),
    toString(number + 2)
FROM numbers(20, 10);

INSERT INTO table_for_rename1 SELECT
    toDate('2019-10-01') + number % 3,
    number,
    toString(number),
    toString(number),
    toString(number + 2)
FROM numbers(20, 10);