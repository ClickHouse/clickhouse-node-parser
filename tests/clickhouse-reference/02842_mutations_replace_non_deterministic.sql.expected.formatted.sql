SET mutations_sync = 2;

SET mutations_execute_subqueries_on_initiator = 1;

SET mutations_execute_nondeterministic_on_initiator = 1;

-- SELECT sum(...)
CREATE TABLE t_mutations_nondeterministic
(
    id UInt64,
    v UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;

INSERT INTO t_mutations_nondeterministic;

SELECT
    id,
    v
FROM t_mutations_nondeterministic
ORDER BY id ASC;

SELECT command
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND is_done
ORDER BY command ASC;

-- SELECT groupArray(...)
CREATE TABLE t_mutations_nondeterministic
(
    id UInt64,
    v Array(UInt64)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;

INSERT INTO t_mutations_nondeterministic;

-- SELECT uniqExactState(...)
CREATE TABLE t_mutations_nondeterministic
(
    id UInt64,
    v AggregateFunction(uniqExact, UInt64)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;

INSERT INTO t_mutations_nondeterministic;

SELECT
    id,
    finalizeAggregation(v)
FROM t_mutations_nondeterministic
ORDER BY id ASC;

-- now()
CREATE TABLE t_mutations_nondeterministic
(
    id UInt64,
    v DateTime
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;

INSERT INTO t_mutations_nondeterministic;

SELECT
    id,
    and(greaterOrEquals(v, now() - toIntervalMinute(10)), lessOrEquals(v, now()))
FROM t_mutations_nondeterministic;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND is_done
ORDER BY command ASC;

INSERT INTO t_mutations_nondeterministic;

-- DELETE WHERE now()
CREATE TABLE t_mutations_nondeterministic
(
    id UInt64,
    d DateTime
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/02842_mutations_replace', '1')
ORDER BY id;

INSERT INTO t_mutations_nondeterministic;

SELECT replaceRegexpOne(command, '(\\d{10})', 'timestamp')
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_mutations_nondeterministic'
    AND NOT is_done
ORDER BY command ASC;

SELECT
    id,
    d
FROM t_mutations_nondeterministic
ORDER BY id ASC;