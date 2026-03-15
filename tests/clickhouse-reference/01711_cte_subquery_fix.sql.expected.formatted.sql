CREATE TABLE t
ENGINE = Memory AS
WITH cte AS (
    SELECT *
    FROM numbers(10)
)

SELECT *
FROM cte;

CREATE VIEW view1
AS
WITH t AS (
    SELECT number AS n
    FROM numbers(3)
)

SELECT n
FROM t;