CREATE TABLE IF NOT EXISTS test (a UInt64) ENGINE=MergeTree() ORDER BY a;
CREATE TABLE IF NOT EXISTS tab (x UInt32, y UInt32) engine = MergeTree ORDER BY tuple();
CREATE DICTIONARY IF NOT EXISTS dict (x UInt32, y UInt32) primary key x source(clickhouse(table 'tab')) LAYOUT(FLAT()) LIFETIME(MIN 0 MAX 1000);
CREATE TABLE IF NOT EXISTS tab2 (x UInt32, y UInt32 materialized dictGet(dict, 'y', x)) engine = MergeTree ORDER BY (y);
SET mutations_sync=2;
