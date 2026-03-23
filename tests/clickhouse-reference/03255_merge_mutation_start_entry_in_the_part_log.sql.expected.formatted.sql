CREATE TABLE test
(
    x UInt8,
    y UInt8,
    z String DEFAULT toString(x)
)
ORDER BY x
PARTITION BY x;

INSERT INTO test (x, y);

INSERT INTO test (x, y);

INSERT INTO test (x, y);

SET mutations_sync = 1;

SELECT *
FROM test
ORDER BY `ALL` ASC;

SELECT
    event_type,
    merge_reason,
    table,
    part_name,
    partition_id,
    `partition`,
    `rows`,
    merged_from
FROM `system`.part_log
WHERE database = currentDatabase()
    AND event_type IN ('MergePartsStart', 'MergeParts', 'MutatePartStart', 'MutatePart')
ORDER BY event_time_microseconds ASC
FORMAT Vertical;