SYSTEM DROP  TABLE IF EXISTS a SYNC;

CREATE TABLE a
(
    x String,
    y String MATERIALIZED 'str'
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/a', 'r1')
ORDER BY x;

INSERT INTO a SELECT toString(number)
FROM numbers(100);

SELECT
    'BEFORE',
    table,
    name,
    type,
    default_kind,
    default_expression
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'a'
ORDER BY
    table ASC,
    name ASC;

SELECT
    'AFTER',
    table,
    name,
    type,
    default_kind,
    default_expression
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'a'
ORDER BY
    table ASC,
    name ASC;