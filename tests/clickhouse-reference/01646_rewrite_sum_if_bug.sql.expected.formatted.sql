SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    s String
)
ENGINE = Memory AS
SELECT arrayJoin(['a','b','c']);

SELECT round((sum(multiIf(s IN ('a', 'b'), 1, 0)) / count()) * 100) AS r
FROM cluster('test_cluster_two_shards', currentDatabase(), t);

SYSTEM DROP  TABLE t;

SYSTEM DROP  TABLE IF EXISTS test_alias;

CREATE TABLE test_alias
(
    a Int64,
    b Int64,
    c Int64,
    day Date,
    rtime DateTime
)
ENGINE = Memory AS
SELECT
    0,
    0,
    0,
    '2022-01-01',
    0
FROM zeros(10);

SYSTEM DROP  TABLE test_alias;