CREATE TABLE test (x UInt8) ORDER BY x;
INSERT INTO test VALUES (1);
INSERT INTO test VALUES (2);
SELECT ProfileEvents['Merge'], ProfileEvents['MergeSourceParts'], ProfileEvents['MergedRows'], ProfileEvents['MergedColumns'] FROM system.part_log WHERE database = currentDatabase() AND table = 'test' AND event_type = 'MergeParts';
