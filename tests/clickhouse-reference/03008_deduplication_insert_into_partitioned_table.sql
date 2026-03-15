SET deduplicate_blocks_in_dependent_materialized_views = 1;
CREATE TABLE partitioned_table
    (key Int64, value String)
    ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03008_deduplication_insert_into_partitioned_table', '{replica}')
    partition by key % 10
    order by tuple();
CREATE MATERIALIZED VIEW mv_table (key Int64, value String)
    ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03008_deduplication_insert_into_partitioned_table_mv', '{replica}')
    ORDER BY tuple()
    AS SELECT key, value FROM partitioned_table;
SELECT * FROM partitioned_table ORDER BY ALL;
SELECT * FROM mv_table ORDER BY ALL;
