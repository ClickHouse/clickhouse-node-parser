CREATE TABLE t_delete_empty_part_rmt
(
    a UInt64,
    b UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_delete_empty_part_rmt', '1')
ORDER BY b
PARTITION BY a;

SET insert_keeper_fault_injection_probability = 0.0;

SET mutations_sync = 2;

SELECT count()
FROM t_delete_empty_part_rmt;

SELECT
    part_name,
    ProfileEvents['MutationTotalParts'],
    ProfileEvents['MutationUntouchedParts'],
    ProfileEvents['MutationCreatedEmptyParts']
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_delete_empty_part_rmt'
    AND event_type = 'MutatePart'
ORDER BY part_name ASC;