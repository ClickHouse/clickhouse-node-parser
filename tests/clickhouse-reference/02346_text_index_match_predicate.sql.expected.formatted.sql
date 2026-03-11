SELECT *
FROM tab
WHERE match(str, ' Hello (ClickHouse|World) ')
ORDER BY id ASC;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, ' Hello (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, ' Hello (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT '---';

SELECT *
FROM tab
WHERE match(str, '.* (ClickHouse|World) ')
ORDER BY id ASC;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, '.* (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, '.* (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT *
FROM tab
WHERE match(str, ' OLAP .*')
ORDER BY id ASC;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, ' OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT trim(`explain`)
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tab
        WHERE match(str, ' OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;