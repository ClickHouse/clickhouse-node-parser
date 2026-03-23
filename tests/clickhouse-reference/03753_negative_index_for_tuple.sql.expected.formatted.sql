-- { echo }
SELECT
    (1, 2).-1,
    (1, 2).-2;

SELECT tuple().-1; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }

SELECT (1, 2, 3).-4; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }

SELECT tupleElement((1, 2), negate(1e42)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT tupleElement((1, 'hello'), -10, 2);

SYSTEM drop  table if exists a1;

SYSTEM drop  table if exists a2;

CREATE TABLE a1
(
    i int,
    hash_key int
)
PARTITION BY (i, hash_key);

CREATE TABLE a2
(
    i int,
    j int,
    hash_key int
)
PARTITION BY (i, j, hash_key);

INSERT INTO a1;

INSERT INTO a2;

SELECT *
FROM (
        SELECT _partition_value.-1
        FROM a1
        UNION ALL
        SELECT _partition_value.-1
        FROM a2
    )
ORDER BY `all` ASC;

SYSTEM drop  table a1;

SYSTEM drop  table a2;

SET enable_analyzer = 1;

SET optimize_functions_to_subcolumns = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    tuple Tuple(b UInt32, c Int32)
)
ENGINE = Memory;

SYSTEM drop  table test;