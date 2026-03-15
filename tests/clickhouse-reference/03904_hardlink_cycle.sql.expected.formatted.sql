-- Tags: no-fasttest
CREATE TABLE hardlink_cycle
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY a
SETTINGS disk = 's3_disk', min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, min_level_for_wide_part = 0, sleep_before_loading_outdated_parts_ms = 10000;

SET mutations_sync = 2, alter_sync = 2;