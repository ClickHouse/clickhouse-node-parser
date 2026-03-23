CREATE TABLE IF NOT EXISTS test (a UInt64) ENGINE=MergeTree() ORDER BY a;
INSERT INTO test (a) SELECT 1 FROM numbers(1000);
CREATE TABLE IF NOT EXISTS tab (x UInt32, y UInt32) engine = MergeTree ORDER BY tuple();
CREATE DICTIONARY IF NOT EXISTS dict (x UInt32, y UInt32) primary key x source(clickhouse(table 'tab')) LAYOUT(FLAT()) LIFETIME(MIN 0 MAX 1000);
INSERT INTO tab VALUES (1, 2), (3, 4);
CREATE TABLE IF NOT EXISTS tab2 (x UInt32, y UInt32 materialized dictGet(dict, 'y', x)) engine = MergeTree ORDER BY (y);
INSERT INTO tab2 (x) VALUES (1), (3);
INSERT INTO tab VALUES (1, 4), (3, 2);
SET mutations_sync=2;
