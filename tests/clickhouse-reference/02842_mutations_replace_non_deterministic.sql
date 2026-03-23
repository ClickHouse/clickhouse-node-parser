SET mutations_sync = 2;
SET mutations_execute_subqueries_on_initiator = 1;
SET mutations_execute_nondeterministic_on_initiator = 1;
-- SELECT sum(...)

CREATE TABLE t_mutations_nondeterministic (id UInt64, v UInt64)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;
INSERT INTO t_mutations_nondeterministic VALUES (10, 20);
SELECT id, v FROM t_mutations_nondeterministic ORDER BY id;
SELECT command FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND is_done
ORDER BY command;
-- SELECT groupArray(...)

CREATE TABLE t_mutations_nondeterministic (id UInt64, v Array(UInt64))
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;
INSERT INTO t_mutations_nondeterministic VALUES (10, [20]);
-- SELECT uniqExactState(...)

CREATE TABLE t_mutations_nondeterministic (id UInt64, v AggregateFunction(uniqExact, UInt64))
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;
INSERT INTO t_mutations_nondeterministic VALUES (10, initializeAggregation('uniqExactState', 1::UInt64));
SELECT id, finalizeAggregation(v) FROM t_mutations_nondeterministic ORDER BY id;
-- now()

CREATE TABLE t_mutations_nondeterministic (id UInt64, v DateTime)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;
INSERT INTO t_mutations_nondeterministic VALUES (10, '2020-10-10');
SELECT id, v BETWEEN now() - INTERVAL 10 MINUTE AND now() FROM t_mutations_nondeterministic;
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND is_done
ORDER BY command;
INSERT INTO t_mutations_nondeterministic VALUES (10, 10);
-- DELETE WHERE now()

CREATE TABLE t_mutations_nondeterministic (id UInt64, d DateTime)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;
INSERT INTO t_mutations_nondeterministic VALUES (10, '2000-10-10'), (20, '2100-10-10');
SELECT
    replaceRegexpOne(command, '(\\d{10})', 'timestamp'),
FROM system.mutations
WHERE database = currentDatabase() AND table = 't_mutations_nondeterministic' AND NOT is_done
ORDER BY command;
SELECT id, d FROM t_mutations_nondeterministic ORDER BY id;
