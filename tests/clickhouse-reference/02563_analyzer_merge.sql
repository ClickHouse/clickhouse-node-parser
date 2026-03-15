-- Tags: no-parallel

SET enable_analyzer = 1;
CREATE DATABASE 02563_db;
CREATE TABLE 02563_db.test_merge_table_1
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
CREATE TABLE 02563_db.test_merge_table_2
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
CREATE TABLE 02563_db.test_merge_table
(
    id UInt64,
    value String
) ENGINE=Merge(02563_db, '^test_merge_table');
SELECT id, value, _database, _table FROM 02563_db.test_merge_table ORDER BY id;
CREATE TABLE 02563_db.t_1
(
    timestamp DateTime64(9),
    a String,
    b String
)
ENGINE = MergeTree
PARTITION BY formatDateTime(toStartOfMinute(timestamp), '%Y%m%d%H', 'UTC')
ORDER BY (timestamp, a, b);
CREATE TABLE 02563_db.dist_t_1 (timestamp DateTime64(9), a String, b String) ENGINE = Distributed('test_shard_localhost', '02563_db', 't_1');
CREATE TABLE 02563_db.m ENGINE = Merge('02563_db', '^dist_');
SELECT '91138316-5127-45ac-9c25-4ad8779777b4',
  count()
FROM 02563_db.m;
