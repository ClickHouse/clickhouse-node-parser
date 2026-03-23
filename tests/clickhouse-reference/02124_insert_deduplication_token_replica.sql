CREATE TABLE insert_dedup_token1 (
    id Int32, val UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/insert_dedup_token', 'r1') ORDER BY id;
INSERT INTO insert_dedup_token1 VALUES(1, 1001);
SELECT * FROM insert_dedup_token1 ORDER BY id;
SELECT DISTINCT exception FROM system.part_log
WHERE table = 'insert_dedup_token1'
  AND database = currentDatabase()
  AND event_type = 'NewPart'
  AND error = 389;
set insert_deduplication_token = '1';
INSERT INTO insert_dedup_token1 VALUES(2, 1002);
set insert_deduplication_token = '';
CREATE TABLE insert_dedup_token2 (
    id Int32, val UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/insert_dedup_token', 'r2') ORDER BY id;
INSERT INTO insert_dedup_token2 VALUES(1, 1001); -- deduplicated by data digest
SELECT * FROM insert_dedup_token2 ORDER BY id;
INSERT INTO insert_dedup_token2 VALUES(3, 1003); -- deduplicated by dedup token
set insert_deduplication_token = '2';
INSERT INTO insert_dedup_token2  VALUES(2, 1002); -- inserted
