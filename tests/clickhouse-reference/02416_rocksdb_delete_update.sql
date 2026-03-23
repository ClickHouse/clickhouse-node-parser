-- Tags: no-ordinary-database, no-fasttest, use-rocksdb

DROP TABLE IF EXISTS 02416_rocksdb;
CREATE TABLE 02416_rocksdb (key UInt64, value String, value2 UInt64) Engine=EmbeddedRocksDB PRIMARY KEY(key);
INSERT INTO 02416_rocksdb VALUES (1, 'Some string', 0), (2, 'Some other string', 0), (3, 'random', 0), (4, 'random2', 0);
SELECT * FROM 02416_rocksdb ORDER BY key;
SELECT '-----------';
SELECT count() FROM 02416_rocksdb;
INSERT INTO 02416_rocksdb VALUES (1, 'String', 10), (2, 'String', 20), (3, 'String', 30), (4, 'String', 40);
