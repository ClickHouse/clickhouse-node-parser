CREATE TABLE test_alter_on_mutation
(
    date Date,
    key UInt64,
    value String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01062/alter_on_mutation', '1')
ORDER BY key
PARTITION BY date;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-05'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-06'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-07'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100;

SELECT sum(CAST(value AS UInt64))
FROM test_alter_on_mutation;

SELECT sum(value)
FROM test_alter_on_mutation;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-05'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100, 100;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-06'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100, 100;

INSERT INTO test_alter_on_mutation SELECT
    toDate('2020-01-07'),
    number,
    toString(number)
FROM `system`.numbers
LIMIT 100, 100;

SELECT sum(value1)
FROM test_alter_on_mutation;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE nested_alter
(
    d Date,
    k UInt64,
    i32 Int32,
    dt DateTime,
    `n.ui8` Array(UInt8),
    `n.s` Array(String),
    `n.d` Array(Date),
    s String DEFAULT '0'
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01062/nested_alter', 'r2', d, k, 8192);

INSERT INTO nested_alter;

SELECT *
FROM nested_alter;