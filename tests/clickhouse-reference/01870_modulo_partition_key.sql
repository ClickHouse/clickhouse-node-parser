SET insert_keeper_max_retries=100;
SET insert_keeper_retry_max_backoff_ms=10;
CREATE TABLE table1 (id Int64, v UInt64)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/test_table12', '1', v)
PARTITION BY id % 200 ORDER BY id;
SELECT toInt64(partition) as p FROM system.parts WHERE table='table1' and database=currentDatabase() ORDER BY p;
select id from table1 where id % 200 = 2 OR id % 200 = -2 order by id;
select id from table1 where id % 200 > 0 order by id;
select id from table1 where id % 200 < 0 order by id;
CREATE TABLE table2 (id Int64, v UInt64)
ENGINE = MergeTree()
PARTITION BY (toInt32(id / 2) % 3, id % 200) ORDER BY id;
SELECT partition as p FROM system.parts WHERE table='table2' and database=currentDatabase() ORDER BY p;
CREATE TABLE table3 (id Int64, v UInt64)
ENGINE = MergeTree()
PARTITION BY (id % 200, (id % 200) % 10, toInt32(round((id % 200) / 2, 0))) ORDER BY id;
SELECT partition as p FROM system.parts WHERE table='table3' and database=currentDatabase() ORDER BY p;
CREATE TABLE table4 (id Int64, v UInt64, s String,
INDEX a (id * 2, s) TYPE minmax GRANULARITY 3
) ENGINE = MergeTree() PARTITION BY id % 10 ORDER BY v;
SELECT count() FROM table4 WHERE id % 10 = 7;
SELECT v, v-205 as vv, modulo(vv, 200), moduloLegacy(vv, 200) FROM table1 ORDER BY v;
