-- The bug is appears only for Wide part.
CREATE TABLE ttl_02265
(
    date Date,
    key Int,
    value String TTL date + toIntervalMonth(1)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl_02265', 'r1')
ORDER BY key
PARTITION BY date
SETTINGS min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0;

CREATE TABLE ttl_02265_r2
(
    date Date,
    key Int,
    value String TTL date + toIntervalMonth(1)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl_02265', 'r2')
ORDER BY key
PARTITION BY date
SETTINGS min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0;

-- after, 20100101_0_0_0 will have ttl.txt and value.bin
INSERT INTO ttl_02265;

SELECT *
FROM `system`.part_log
WHERE database = currentDatabase()
    AND like(table, 'ttl_02265%')
    AND error != 0
    AND errorCodeToName(error) != 'NO_REPLICA_HAS_PART';