SET apply_mutations_on_fly = 1;
SET mutations_execute_subqueries_on_initiator = 1;
SET mutations_execute_nondeterministic_on_initiator = 1;
-- SELECT sum(...)

CREATE TABLE t_lightweight_mut_5 (id UInt64, v UInt64) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_lightweight_mut_5 VALUES (10, 20);
SELECT id, v FROM t_lightweight_mut_5 ORDER BY id;
SELECT command FROM system.mutations
WHERE database = currentDatabase() AND table = 't_lightweight_mut_5' AND NOT is_done
ORDER BY command;
-- SELECT groupArray(...)

CREATE TABLE t_lightweight_mut_5 (id UInt64, v Array(UInt64)) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_lightweight_mut_5 VALUES (10, [20]);
SELECT id, length(v) FROM t_lightweight_mut_5 ORDER BY id; -- { serverError BAD_ARGUMENTS }
-- SELECT uniqExactState(...)

CREATE TABLE t_lightweight_mut_5 (id UInt64, v AggregateFunction(uniqExact, UInt64)) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_lightweight_mut_5 VALUES (10, initializeAggregation('uniqExactState', 1::UInt64));
SELECT id, finalizeAggregation(v) FROM t_lightweight_mut_5 ORDER BY id;
-- now()

CREATE TABLE t_lightweight_mut_5 (id UInt64, v DateTime) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_lightweight_mut_5 VALUES (10, '2020-10-10');
SELECT id, v BETWEEN now() - INTERVAL 10 MINUTE AND now() FROM t_lightweight_mut_5;
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_lightweight_mut_5' AND NOT is_done
ORDER BY command;
INSERT INTO t_lightweight_mut_5 VALUES (10, 10);
SELECT * FROM t_lightweight_mut_5 ORDER BY id; -- { serverError BAD_ARGUMENTS }
SELECT * FROM t_lightweight_mut_5 ORDER BY id SETTINGS apply_mutations_on_fly = 0;
-- DELETE WHERE now()

CREATE TABLE t_lightweight_mut_5 (id UInt64, d DateTime) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_lightweight_mut_5 VALUES (10, '2000-10-10'), (20, '2100-10-10');
SELECT * FROM t_lightweight_mut_5 ORDER BY id SETTINGS apply_mutations_on_fly = 1;
