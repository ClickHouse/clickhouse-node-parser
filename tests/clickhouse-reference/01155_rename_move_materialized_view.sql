-- Tags: no-parallel

SET enable_analyzer = 1;
SET send_logs_level = 'fatal';
SET prefer_localhost_replica = 1;
set allow_deprecated_database_ordinary=1;
-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test_01155_ordinary ENGINE=Ordinary;
CREATE DATABASE test_01155_atomic ENGINE=Atomic;
USE test_01155_ordinary;
CREATE TABLE src (s String, x String DEFAULT 'a') ENGINE=MergeTree() PARTITION BY tuple() ORDER BY s;
CREATE MATERIALIZED VIEW mv1 (s String, x String DEFAULT 'b') ENGINE=MergeTree() PARTITION BY tuple() ORDER BY s AS SELECT (*,).1 || 'mv1' as s FROM src;
CREATE TABLE dst (s String, x String DEFAULT 'c') ENGINE=MergeTree() PARTITION BY tuple() ORDER BY s;
CREATE MATERIALIZED VIEW mv2 TO dst (s String, x String DEFAULT 'd') AS SELECT (*,).1 || 'mv2' as s FROM src;
CREATE TABLE dist (s String, x String DEFAULT 'asdf') ENGINE=Distributed(test_shard_localhost, test_01155_ordinary, src);
CREATE DICTIONARY dict (s String, x String DEFAULT 'qwerty') PRIMARY KEY s
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'dist' DB 'test_01155_ordinary'))
LIFETIME(MIN 0 MAX 2) LAYOUT(COMPLEX_KEY_CACHE(SIZE_IN_CELLS 123));
-- FIXME Cannot convert column `1` because it is non constant in source stream but must be constant in result
SELECT * FROM (SELECT materialize(1), substr(_table, 1, 10) as _table, s FROM merge('test_01155_ordinary', '')) ORDER BY _table, s;
SELECT dictGet('test_01155_ordinary.dict', 'x', 'before moving tables');
SELECT dictGet('test_01155_ordinary.dict1', 'x', 'before moving tables');
SELECT database, name, uuid FROM system.dictionaries WHERE database='test_01155_ordinary';
SET check_table_dependencies=0; -- Otherwise we'll get error "test_01155_ordinary.dict depends on test_01155_ordinary.dist" in the next line.
SET check_table_dependencies=1;
SELECT substr(name, 1, 10) FROM system.tables WHERE database='test_01155_ordinary';
SELECT substr(name, 1, 10) FROM system.tables WHERE database='test_01155_atomic';
USE default;
SELECT materialize(2), substr(_table, 1, 10), s FROM merge('test_01155_atomic', '') ORDER BY _table, s; -- { serverError UNKNOWN_DATABASE }
SELECT dictGet('test_01155_ordinary.dict', 'x', 'after moving tables'); -- { serverError BAD_ARGUMENTS }
SELECT * FROM (SELECT materialize(3), substr(_table, 1, 10) as _table, s FROM merge('test_01155_ordinary', '')) ORDER BY _table, s;
SELECT dictGet('test_01155_ordinary.dict', 'x', 'after renaming database');
SELECT database, substr(name, 1, 10) FROM system.tables WHERE database like 'test_01155_%';
-- Creation of a database with Ordinary engine emits a warning.
SET send_logs_level='fatal';
SET send_logs_level='warning';
SELECT * FROM (SELECT materialize(4), substr(_table, 1, 10) as _table, s FROM merge('test_01155_ordinary', '')) ORDER BY _table, s;
SELECT dictGet('test_01155_ordinary.dict', 'x', 'after renaming tables');
