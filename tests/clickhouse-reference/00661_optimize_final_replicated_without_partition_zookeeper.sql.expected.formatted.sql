-- Tags: replica
-- May affect part names
SET prefer_warmed_unmerged_parts_seconds = 0;

SET ignore_cold_parts_seconds = 0;

SET optimize_on_insert = 0;

CREATE TABLE partitioned_by_tuple_replica1_00661
(
    d Date,
    x UInt8,
    w String,
    y UInt8
)
ENGINE = ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test/partitioned_by_tuple_00661', '1')
ORDER BY (d, x, w)
PARTITION BY (d, x)
SETTINGS cache_populated_by_fetch = 0;

CREATE TABLE partitioned_by_tuple_replica2_00661
(
    d Date,
    x UInt8,
    w String,
    y UInt8
)
ENGINE = ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test/partitioned_by_tuple_00661', '2')
ORDER BY (d, x, w)
PARTITION BY (d, x)
SETTINGS cache_populated_by_fetch = 0;

SELECT *
FROM partitioned_by_tuple_replica2_00661
ORDER BY
    d ASC,
    x ASC,
    w ASC,
    y ASC;