-- Queries with 'IN'
SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a IN (
                SELECT *
                FROM `system`.one
            )
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a IN (1, 2, 3)
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a IN (t_02809_set)
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a IN (t_02809_aux)
    )
WHERE like(`explain`, '%Prewhere filter');

-- Queries with 'NOT IN'
SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a NOT IN (
                SELECT *
                FROM `system`.one
            )
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a NOT IN (1, 2, 3)
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a NOT IN (t_02809_set)
    )
WHERE like(`explain`, '%Prewhere filter');

SELECT *
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM t_02809
        WHERE a NOT IN (t_02809_aux)
    )
WHERE like(`explain`, '%Prewhere filter');