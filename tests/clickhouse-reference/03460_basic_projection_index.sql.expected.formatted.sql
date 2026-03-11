SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_proj
        WHERE region = 'eu'
            AND user_id = 101
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_proj
WHERE region = 'eu'
    AND user_id = 101
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_proj
        WHERE region = 'zzz'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_proj
WHERE region = 'zzz'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_proj
        WHERE user_id = 106
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_proj
WHERE user_id = 106
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_proj
        WHERE region = 'asia'
            OR user_id = 101
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_proj
WHERE region = 'asia'
    OR user_id = 101
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_gran
        WHERE region = 'top'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_gran
WHERE region = 'top'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_gran
        WHERE region = 'mid'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_gran
WHERE region = 'mid'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_gran
        WHERE region = 'bot'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_gran
WHERE region = 'bot'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_partial
        WHERE region = 'ru'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_partial
WHERE region = 'ru'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM t_partial
        WHERE region = 'cn'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM t_partial
WHERE region = 'cn'
ORDER BY `ALL` ASC;

SELECT
    table,
    name
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table IN ('t_repl', 't_repl2')
ORDER BY `ALL` ASC;