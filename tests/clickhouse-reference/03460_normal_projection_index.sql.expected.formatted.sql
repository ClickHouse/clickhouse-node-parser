-- { echo ON }
SET enable_analyzer = 1;

-- enable projection for parallel replicas
SET parallel_replicas_local_plan = 1;

SET optimize_aggregation_in_order = 0;

CREATE TABLE test_simple_projection
(
    id UInt64,
    event_date Date,
    user_id UInt32,
    url String,
    region String,
    PROJECTION region_proj (    SELECT _part_offset
    ORDER BY region ASC),
    PROJECTION user_id_proj (    SELECT _part_offset
    ORDER BY user_id ASC)
)
ENGINE = MergeTree
ORDER BY (event_date, id)
SETTINGS index_granularity = 1, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, enable_vertical_merge_algorithm = 0;

-- aggressively use projection index
SET min_table_rows_to_use_projection_index = 0;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_simple_projection
        WHERE region = 'europe'
            AND user_id = 101
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_simple_projection
WHERE region = 'europe'
    AND user_id = 101
ORDER BY `ALL` ASC;

-- region_proj is enough to filter part
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_simple_projection
        WHERE region = 'zzz'
            AND user_id = 101
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_simple_projection
WHERE region = 'zzz'
    AND user_id = 101
ORDER BY `ALL` ASC;

-- narrowing filter via user_id_proj
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_simple_projection
        WHERE region = 'us_west'
            AND user_id = 106
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_simple_projection
WHERE region = 'us_west'
    AND user_id = 106
ORDER BY `ALL` ASC;

-- it's not possible to use different projection indexes with or filter
SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_simple_projection
        WHERE region = 'asia'
            OR user_id = 101
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_simple_projection
WHERE region = 'asia'
    OR user_id = 101
ORDER BY `ALL` ASC;

-- Fuzzer
SELECT
    *,
    _part_offset = ((isNullable(1) = toUInt128(6))),
    *
FROM test_simple_projection
PREWHERE (101 = user_id) = ignore(255, isZeroOrNull(assumeNotNull(0)))
WHERE (106 = user_id)
    AND (region = 'us_west');

CREATE TABLE test_projection_granule_edge_cases
(
    id UInt64,
    region String,
    user_id UInt32,
    PROJECTION region_proj (    SELECT _part_offset
    ORDER BY region ASC)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 16, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, enable_vertical_merge_algorithm = 0;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_projection_granule_edge_cases
        WHERE region = 'top_region'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_projection_granule_edge_cases
WHERE region = 'top_region'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_projection_granule_edge_cases
        WHERE region = 'mid_region'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_projection_granule_edge_cases
WHERE region = 'mid_region'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_projection_granule_edge_cases
        WHERE region = 'bol_region'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_projection_granule_edge_cases
WHERE region = 'bol_region'
ORDER BY `ALL` ASC;

CREATE TABLE test_partial_projection
(
    id UInt64,
    region String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 1, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, enable_vertical_merge_algorithm = 0;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_partial_projection
        WHERE region = 'ru'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_partial_projection
WHERE region = 'ru'
ORDER BY `ALL` ASC;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN projections = 1
        SELECT *
        FROM test_partial_projection
        WHERE region = 'cn'
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR match(`explain`, '^\\s+[A-Z][a-z]+(\\s+[A-Z][a-z]+)*:');

SELECT *
FROM test_partial_projection
WHERE region = 'cn'
ORDER BY `ALL` ASC;