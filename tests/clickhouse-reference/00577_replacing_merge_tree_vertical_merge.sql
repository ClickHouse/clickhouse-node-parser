set optimize_on_insert = 0;
create table tab_00577 (date Date, version UInt64, val UInt64) engine = ReplacingMergeTree(version) partition by date order by date settings enable_vertical_merge_algorithm = 1,
    vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0, min_rows_for_wide_part = 0,
    min_bytes_for_wide_part = 0, allow_experimental_replacing_merge_with_cleanup=1;
select * from tab_00577 order by version;
select * from tab_00577;
CREATE TABLE testCleanupR1 (uid String, version UInt32, is_deleted UInt8)
    ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_cleanup/', 'r1', version, is_deleted)
    ORDER BY uid SETTINGS enable_vertical_merge_algorithm = 1, vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0, min_rows_for_wide_part = 0,
    min_bytes_for_wide_part = 0, allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testCleanupR1 order by uid;
