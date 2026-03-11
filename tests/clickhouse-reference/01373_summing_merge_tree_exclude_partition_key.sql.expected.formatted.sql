SELECT '---';

SELECT count(*)
FROM tt_01373;

SELECT count(*)
FROM tt_01373 FINAL;

SELECT
    a,
    count()
FROM tt_01373 FINAL
GROUP BY a
ORDER BY a ASC;

SELECT
    a,
    count()
FROM tt_01373
GROUP BY a
ORDER BY a ASC;

SELECT
    *,
    _partition_id
FROM tt_01373_expr
ORDER BY (a, d, val) ASC;