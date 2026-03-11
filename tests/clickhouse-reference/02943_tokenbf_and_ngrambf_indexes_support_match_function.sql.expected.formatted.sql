SELECT *
FROM tokenbf_tab
WHERE match(str, ' Hello (ClickHouse|World) ')
ORDER BY id ASC;

SELECT *
FROM ngrambf_tab
WHERE match(str, 'Hello (ClickHouse|World)')
ORDER BY id ASC;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, ' Hello (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, ' Hello (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, 'Hello (ClickHouse|World)')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, 'Hello (ClickHouse|World)')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT '---';

SELECT *
FROM tokenbf_tab
WHERE match(str, '.* (ClickHouse|World) ')
ORDER BY id ASC;

SELECT *
FROM ngrambf_tab
WHERE match(str, '.*(ClickHouse|World)')
ORDER BY id ASC;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, '.* (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, '.* (ClickHouse|World) ')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, '.*(ClickHouse|World)')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, '.*(ClickHouse|World)')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT *
FROM tokenbf_tab
WHERE match(str, ' OLAP .*')
ORDER BY id ASC;

SELECT *
FROM ngrambf_tab
WHERE match(str, 'OLAP.*')
ORDER BY id ASC;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, ' OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM tokenbf_tab
        WHERE match(str, ' OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, 'OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM ngrambf_tab
        WHERE match(str, 'OLAP (.*?)*')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS enable_analyzer = 1;