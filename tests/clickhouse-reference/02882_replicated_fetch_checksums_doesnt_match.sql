CREATE TABLE checksums_r1 (column1 UInt32, column2 String) Engine = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r1') ORDER BY tuple();
CREATE TABLE checksums_r2 (column1 UInt32, column2 String) Engine = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r2') ORDER BY tuple();
CREATE TABLE checksums_r3 (column1 UInt32, column2 String) Engine = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r3') ORDER BY tuple();
INSERT INTO checksums_r1 VALUES (1, 'hello');
INSERT INTO checksums_r3 VALUES (1, 'hello');
SELECT count() FROM checksums_r1;
SELECT count() FROM checksums_r2;
SELECT count() FROM checksums_r3;
SET max_rows_to_read = 0; -- system.text_log can be really big
SELECT * FROM system.text_log WHERE event_time >= now() - INTERVAL 120 SECOND and level == 'Error' and message like '%CHECKSUM_DOESNT_MATCH%' and logger_name like ('%' || currentDatabase() || '%checksums_r%');
