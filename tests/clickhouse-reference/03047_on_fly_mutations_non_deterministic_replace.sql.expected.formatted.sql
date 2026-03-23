SYSTEM DROP  TABLE IF EXISTS t_lightweight_mut_5;

SET apply_mutations_on_fly = 1;

SET mutations_execute_subqueries_on_initiator = 1;

SET mutations_execute_nondeterministic_on_initiator = 1;

-- SELECT sum(...)
CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lightweight_mut_5;

SELECT
    id,
    v
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT command
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_mut_5'
    AND NOT is_done
ORDER BY command ASC;

SYSTEM DROP  TABLE t_lightweight_mut_5;

-- SELECT groupArray(...)
CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    v Array(UInt64)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lightweight_mut_5;

SELECT
    id,
    length(v)
FROM t_lightweight_mut_5
ORDER BY id ASC; -- { serverError BAD_ARGUMENTS }

-- SELECT uniqExactState(...)
CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    v AggregateFunction(uniqExact, UInt64)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lightweight_mut_5;

SELECT
    id,
    finalizeAggregation(v)
FROM t_lightweight_mut_5
ORDER BY id ASC;

-- now()
CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    v DateTime
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lightweight_mut_5;

SELECT
    id,
    and(greaterOrEquals(v, now() - toIntervalMinute(10)), lessOrEquals(v, now()))
FROM t_lightweight_mut_5;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_mut_5'
    AND NOT is_done
ORDER BY command ASC;

INSERT INTO t_lightweight_mut_5;

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC; -- { serverError BAD_ARGUMENTS }

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 0;

-- DELETE WHERE now()
CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lightweight_mut_5;

SELECT *
FROM t_lightweight_mut_5
ORDER BY id ASC
SETTINGS apply_mutations_on_fly = 1;