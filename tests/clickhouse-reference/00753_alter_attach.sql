DROP TABLE IF EXISTS alter_attach;
CREATE TABLE alter_attach (x UInt64, p UInt8) ENGINE = MergeTree ORDER BY tuple() PARTITION BY p;
INSERT INTO alter_attach VALUES (1, 1), (2, 1), (3, 1);
INSERT INTO alter_attach VALUES (4, 2, 'Hello'), (5, 2, 'World');
SELECT * FROM alter_attach ORDER BY x;
INSERT INTO alter_attach VALUES (6, 3), (7, 3);
DROP TABLE IF EXISTS detach_all_no_partition;
CREATE TABLE detach_all_no_partition (x UInt64, p UInt8) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO detach_all_no_partition VALUES (1, 1), (2, 1), (3, 1);
SELECT * FROM detach_all_no_partition ORDER BY x;
DROP TABLE alter_attach;
DROP TABLE detach_all_no_partition;
DROP TABLE IF EXISTS replicated_table_detach_all1;
DROP TABLE IF EXISTS replicated_table_detach_all2;
CREATE TABLE replicated_table_detach_all1 (
  id UInt64,
  Data String
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_table_detach_all', '1') ORDER BY id PARTITION BY id;
CREATE TABLE replicated_table_detach_all2 (
  id UInt64,
  Data String
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_table_detach_all', '2') ORDER BY id PARTITION BY id;
INSERT INTO replicated_table_detach_all1 VALUES (1, '1'), (2, '2');
select * from replicated_table_detach_all1 order by id;
select * from replicated_table_detach_all2 order by id;
DROP TABLE replicated_table_detach_all1;
DROP TABLE replicated_table_detach_all2;
DROP TABLE IF EXISTS partition_all;
DROP TABLE IF EXISTS partition_all2;
CREATE TABLE partition_all (x UInt64, p UInt8, q UInt8) ENGINE = MergeTree ORDER BY tuple() PARTITION BY p;
INSERT INTO partition_all VALUES (4, 1, 2), (5, 1, 3), (3, 1, 4);
CREATE TABLE partition_all2 (x UInt64, p UInt8, q UInt8) ENGINE = MergeTree ORDER BY tuple() PARTITION BY p;
INSERT INTO partition_all2 VALUES (4, 1, 2), (5, 1, 3), (3, 1, 4);
DROP TABLE partition_all;
DROP TABLE partition_all2;
-- test ATTACH ALL
CREATE TABLE partition_attach_all (x UInt64, p UInt8) ENGINE = MergeTree ORDER BY x PARTITION BY p;
INSERT INTO partition_attach_all VALUES (1, 1), (2, 2), (3, 3);
SELECT * FROM partition_attach_all ORDER BY x;
CREATE TABLE replicated_partition_attach_all (x UInt64, p UInt8)
    ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_partition_attach_all', '1')
        ORDER BY x
        PARTITION BY p;
INSERT INTO replicated_partition_attach_all VALUES (1, 1), (2, 2), (3, 3);
SELECT * FROM replicated_partition_attach_all ORDER BY x;
DROP TABLE partition_attach_all;
DROP TABLE replicated_partition_attach_all;
