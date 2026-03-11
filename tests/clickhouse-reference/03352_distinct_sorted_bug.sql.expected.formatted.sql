SELECT DISTINCT
    multiIf(1, 2, 1, materialize(toInt128(3)), 4),
    c0
FROM t0;

SELECT
    multiIf(1, 2, 1, materialize(3), 4),
    c0
FROM t0__fuzz_41
FORMAT Null;

SELECT
    multiIf(0, 2, 1, materialize(3), 4),
    c0
FROM t0__fuzz_41
FORMAT Null;

SELECT DISTINCT
    subquery_1.id,
    subquery_2.id
FROM
    (
        SELECT
            1 AS id,
            2 AS value
    ) AS subquery_1
CROSS JOIN (
        SELECT
            3 AS id,
            4
    ) AS subquery_2;