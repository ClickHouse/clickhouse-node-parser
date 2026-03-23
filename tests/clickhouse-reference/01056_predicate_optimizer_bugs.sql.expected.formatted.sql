SET enable_optimize_predicate_expression = 1;

SET joined_subquery_requires_alias = 0;

SET convert_query_to_cnf = 0;

SET enable_analyzer = 1;

SET allow_deprecated_error_prone_window_functions = 1;

SELECT
    k,
    v,
    d,
    i
FROM (
        SELECT
            t.1 AS k,
            t.2 AS v,
            runningDifference(v) AS d,
            runningDifference(cityHash64(t.1)) AS i
        FROM (
                SELECT arrayJoin([('a', 1), ('a', 2), ('a', 3), ('b', 11), ('b', 13), ('b', 15)]) AS t
            )
    )
WHERE i = 0;

SELECT
    co,
    co2,
    co3,
    num
FROM (
        SELECT
            co,
            co2,
            co3,
            count() AS num
        FROM (
                SELECT
                    dummy + 1 AS co,
                    dummy + 2 AS co2,
                    dummy + 3 AS co3
            )
        GROUP BY cube(co, co2, co3)
    )
WHERE co != 0
    AND co2 != 2;

SELECT name
FROM
    (
        SELECT name
        FROM `system`.`settings`
    )
INNER JOIN (
        SELECT name
        FROM `system`.`settings`
    )
    USING (name)
WHERE name = 'enable_optimize_predicate_expression';

CREATE TABLE t1
(
    id UInt32,
    value1 String
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

CREATE TABLE t2
(
    id UInt32,
    value2 String
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

CREATE TABLE t3
(
    id UInt32,
    value3 String
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

INSERT INTO t1 (id, value1);

INSERT INTO t2 (id, value2);

INSERT INTO t3 (id, value3);

CREATE VIEW IF NOT EXISTS view1
AS
SELECT
    t1.id AS id,
    t1.value1 AS value1,
    t2.value2 AS value2,
    t3.value3 AS value3
FROM
    t1
LEFT JOIN t2
    ON t1.id = t2.id
LEFT JOIN t3
    ON t1.id = t3.id
WHERE t1.id > 0;

SELECT *
FROM view1
WHERE id = 1;

SELECT ccc
FROM (
        SELECT 1 AS ccc
        UNION ALL
        SELECT *
        FROM
            (
                SELECT 2 AS ccc
            )
        INNER JOIN (
                SELECT 2 AS ccc
            )
            USING (ccc)
    )
WHERE ccc > 1;

CREATE TABLE A
(
    ts DateTime,
    id String,
    id_b String
)
ENGINE = MergeTree
ORDER BY (ts, id)
PARTITION BY toStartOfHour(ts);

CREATE TABLE B
(
    ts DateTime,
    id String,
    id_c String
)
ENGINE = MergeTree
ORDER BY (ts, id)
PARTITION BY toStartOfHour(ts);

CREATE TABLE test
(
    A Int32,
    B Int32
)
ENGINE = Memory();

INSERT INTO test;

SELECT
    B,
    neighbor(B, 1) AS next_B
FROM (
        SELECT *
        FROM test
        ORDER BY B ASC
    );

SELECT
    B,
    neighbor(B, 1) AS next_B
FROM (
        SELECT *
        FROM test
        ORDER BY B ASC
    )
WHERE A == 1;

SELECT
    B,
    next_B
FROM (
        SELECT
            A,
            B,
            neighbor(B, 1) AS next_B
        FROM (
                SELECT *
                FROM test
                ORDER BY B ASC
            )
    )
WHERE A == 1;

SELECT *
FROM (
        SELECT *
        FROM `system`.one
    )
WHERE arrayMap(x -> x + 1, [dummy]) = [1];

SELECT *
FROM
    (
        SELECT
            1 AS id,
            2 AS value
    )
INNER JOIN (
        SELECT
            1 AS id,
            3 AS value_1
    )
    USING (id)
WHERE arrayMap(x -> x + value + value_1, [1]) = [6];

-- from #10613
SELECT
    name,
    count() AS cnt
FROM remote('127.{1,2}', `system`.`settings`)
GROUP BY name
HAVING (max(value) > '9')
    AND (min(changed) = 0)
FORMAT Null;