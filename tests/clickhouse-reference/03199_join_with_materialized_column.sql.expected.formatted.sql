SET enable_analyzer = 1;

CREATE TABLE table_with_materialized
(
    col String MATERIALIZED 'A',
    ins Int EPHEMERAL
)
ENGINE = Memory;

SELECT number
FROM
    numbers(1) AS n
CROSS JOIN table_with_materialized;