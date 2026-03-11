SELECT
    _part,
    a,
    b
FROM t_optimize_level
ORDER BY a ASC;

SELECT count()
FROM (
        EXPLAIN PIPELINE
        SELECT
            a,
            b
        FROM t_optimize_level FINAL
    )
WHERE like(`explain`, '%Replacing%');

SELECT name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_optimize_level'
    AND active;