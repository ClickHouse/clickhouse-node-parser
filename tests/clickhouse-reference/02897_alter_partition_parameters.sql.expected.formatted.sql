SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    EventDate Date
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toMonday(EventDate);

INSERT INTO test;

SELECT count()
FROM test;

SET param_partition = '2023-10-09';

SET param_partition_id = '20231009';

SYSTEM DROP  TABLE IF EXISTS test2;

CREATE TABLE test2
(
    a UInt32,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (a * b, b * b);

INSERT INTO test2;

SELECT count()
FROM test2;

SET param_first = '2';

SET param_second = '4';

SYSTEM DROP  TABLE IF EXISTS test3;

CREATE TABLE test3
(
    a UInt32,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY a;

INSERT INTO test3;

SET param_simple = '1';

SELECT count()
FROM test3;

SYSTEM DROP  TABLE IF EXISTS test4;

CREATE TABLE test4
(
    EventDate Date
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY EventDate;

INSERT INTO test4;

SELECT count()
FROM test4;

SYSTEM DROP  TABLE IF EXISTS test5;

CREATE TABLE test5
(
    a UInt32,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (a, b);

INSERT INTO test5;

SET param_f = '1';

SET param_s = '2';

SELECT count()
FROM test5;

SYSTEM DROP  TABLE IF EXISTS test6;

CREATE TABLE test6
(
    a UInt32,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (a, b);

INSERT INTO test6;

SET param_tuple = (1, 2);

SELECT count()
FROM test6;