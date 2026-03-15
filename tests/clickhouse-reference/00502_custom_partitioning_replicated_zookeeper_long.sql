-- Tags: long, replica, no-shared-merge-tree
-- no-shared-merge-tree: different synchronization

SET replication_alter_partitions_sync = 2;
SET insert_keeper_fault_injection_probability=0;
CREATE TABLE not_partitioned_replica1_00502(x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/not_partitioned_00502', '1') ORDER BY x;
CREATE TABLE not_partitioned_replica2_00502(x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/not_partitioned_00502', '2') ORDER BY x;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'not_partitioned_replica1_00502' AND active ORDER BY name;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'not_partitioned_replica2_00502' AND active ORDER BY name;
SELECT sum(x) FROM not_partitioned_replica2_00502;
CREATE TABLE partitioned_by_week_replica1(d Date, x UInt8) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_week_00502', '1') PARTITION BY toMonday(d) ORDER BY x;
CREATE TABLE partitioned_by_week_replica2(d Date, x UInt8) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_week_00502', '2') PARTITION BY toMonday(d) ORDER BY x;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_week_replica1' AND active ORDER BY name;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_week_replica2' AND active ORDER BY name;
SELECT sum(x) FROM partitioned_by_week_replica2;
CREATE TABLE partitioned_by_tuple_replica1_00502(d Date, x UInt8, y UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_tuple_00502', '1') ORDER BY x PARTITION BY (d, x);
CREATE TABLE partitioned_by_tuple_replica2_00502(d Date, x UInt8, y UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_tuple_00502', '2') ORDER BY x PARTITION BY (d, x);
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_tuple_replica1_00502' AND active ORDER BY name;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_tuple_replica2_00502' AND active ORDER BY name;
SELECT sum(y) FROM partitioned_by_tuple_replica2_00502;
CREATE TABLE partitioned_by_string_replica1(s String, x UInt8) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_string_00502', '1') PARTITION BY s ORDER BY x;
CREATE TABLE partitioned_by_string_replica2(s String, x UInt8) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/partitioned_by_string_00502', '2') PARTITION BY s ORDER BY x;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_string_replica1' AND active ORDER BY name;
SELECT partition, name FROM system.parts WHERE database = currentDatabase() AND table = 'partitioned_by_string_replica2' AND active ORDER BY name;
SELECT sum(x) FROM partitioned_by_string_replica2;
CREATE TABLE without_fixed_size_columns_replica1(s String) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/without_fixed_size_columns_00502', '1') PARTITION BY length(s) ORDER BY s;
CREATE TABLE without_fixed_size_columns_replica2(s String) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test/without_fixed_size_columns_00502', '2') PARTITION BY length(s) ORDER BY s;
SELECT partition, name, rows FROM system.parts WHERE database = currentDatabase() AND table = 'without_fixed_size_columns_replica2' AND active ORDER BY name;
SELECT * FROM without_fixed_size_columns_replica2 ORDER BY s;
