SYSTEM DROP  TABLE IF EXISTS tokenbf_tab;

SYSTEM DROP  TABLE IF EXISTS ngrambf_tab;

CREATE TABLE tokenbf_tab
(
    id UInt32,
    str String,
    INDEX idx str TYPE tokenbf_v1(256, 2, 0)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1;

CREATE TABLE ngrambf_tab
(
    id UInt32,
    str String,
    INDEX idx str TYPE ngrambf_v1(3, 256, 2, 0)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1;

INSERT INTO tokenbf_tab;

INSERT INTO ngrambf_tab;

SELECT *
FROM tokenbf_tab
WHERE match(str, ' Hello (ClickHouse|World) ')
ORDER BY id ASC;

SELECT *
FROM ngrambf_tab
WHERE match(str, 'Hello (ClickHouse|World)')
ORDER BY id ASC;

-- Read 2/6 granules
-- Required string: 'Hello '
-- Alternatives: 'Hello ClickHouse', 'Hello World'
-- Surrounded by spaces for tokenbf
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

-- Read 3/6 granules
-- Required string: -
-- Alternatives: 'ClickHouse', 'World'
-- Surrounded by spaces for tokenbf
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

-- Read 1/6 granules
-- Required string: 'OLAP'
-- Alternatives: -
-- Surrounded by spaces for tokenbf
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

SYSTEM DROP  TABLE tokenbf_tab;

SYSTEM DROP  TABLE ngrambf_tab;