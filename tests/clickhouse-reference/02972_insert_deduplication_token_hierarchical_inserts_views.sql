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
CREATE MATERIALIZED VIEW mv_1_2 TO ds_1_1 as
SELECT
    timestamp t, sum(value) v
FROM landing
GROUP BY t;
SELECT sleep(3);
SELECT table, name, error FROM system.part_log
WHERE database = currentDatabase() and error != 389
ORDER BY table, name;
SELECT count() FROM landing;
