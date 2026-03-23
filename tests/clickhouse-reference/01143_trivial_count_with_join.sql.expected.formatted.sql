SYSTEM drop  table if exists t;

CREATE TABLE t
ENGINE = Memory AS
SELECT *
FROM numbers(2);

SELECT count(*)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(*)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count()
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(t.number)
FROM
    t
CROSS JOIN numbers(2) AS r;

SELECT count(r.number)
FROM
    t
CROSS JOIN numbers(2) AS r;

SYSTEM drop  table t;