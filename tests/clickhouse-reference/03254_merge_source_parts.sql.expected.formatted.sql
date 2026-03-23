SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    x UInt8
)
ORDER BY x;

INSERT INTO test;

INSERT INTO test;

SELECT
    ProfileEvents['Merge'],
    ProfileEvents['MergeSourceParts'],
    ProfileEvents['MergedRows'],
    ProfileEvents['MergedColumns']
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 'test'
    AND event_type = 'MergeParts';

SYSTEM DROP  TABLE test;