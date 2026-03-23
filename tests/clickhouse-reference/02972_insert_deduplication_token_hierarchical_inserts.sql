SET insert_deduplicate = 1;
SET deduplicate_blocks_in_dependent_materialized_views = 1;
SET insert_deduplication_token = 'test';
CREATE TABLE landing
(
    timestamp UInt64,
    value UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE TABLE ds_1_1
(
    t UInt64,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_1_1 TO ds_1_1 as
SELECT
    timestamp t, sum(value) v
FROM landing
GROUP BY t;
CREATE TABLE ds_1_2
(
    t UInt64,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_1_2 TO ds_1_2 as
SELECT
    timestamp t, sum(value) v
FROM landing
GROUP BY t;
CREATE TABLE ds_2_1
(
    l String,
    t DateTime,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_2_1 TO ds_2_1 as
SELECT '2_1' l, t, v
FROM ds_1_1;
CREATE MATERIALIZED VIEW mv_2_2 TO ds_2_1 as
SELECT '2_2' l, t, v
FROM ds_1_2;
CREATE TABLE ds_3_1
(
    l String,
    t DateTime,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_3_1 TO ds_3_1 as
SELECT '3_1' l, t, v
FROM ds_2_1;
CREATE TABLE ds_4_1
(
    l String,
    t DateTime,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_4_1 TO ds_4_1 as
SELECT '4_1' l, t, v
FROM mv_3_1;
CREATE TABLE ds_4_2
(
    l String,
    t DateTime,
    v UInt64
)
ENGINE = MergeTree ORDER BY tuple() SETTINGS non_replicated_deduplication_window = 1000;
CREATE MATERIALIZED VIEW mv_4_2 TO ds_4_2 as
SELECT '4_2' l, t, v
FROM mv_3_1;
INSERT INTO landing SELECT 1 as timestamp, 1 AS value FROM numbers(10) ORDER BY ALL;
SELECT sleep(3);
SELECT table, name, error FROM system.part_log
WHERE database = currentDatabase() and error != 389
ORDER BY table, name;
SELECT count() FROM landing;
