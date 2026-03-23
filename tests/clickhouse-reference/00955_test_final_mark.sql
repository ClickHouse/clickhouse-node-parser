-- Tags: no-random-merge-tree-settings

SET send_logs_level = 'fatal';
DROP TABLE IF EXISTS mt_with_pk;
CREATE TABLE mt_with_pk (
  d Date DEFAULT '2000-01-01',
  x DateTime,
  y Array(UInt64),
  z UInt64,
  n Nested (Age UInt8, Name String),
  w Int16 DEFAULT 10
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(d) ORDER BY (x, z) SETTINGS index_granularity_bytes=10000; -- write_final_mark=1 by default
INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 12:57:57'), [1, 1, 1], 11, [77], ['Joe']), (toDate('2018-10-01'), toDateTime('2018-10-01 16:57:57'), [2, 2, 2], 12, [88], ['Mark']), (toDate('2018-10-01'), toDateTime('2018-10-01 19:57:57'), [3, 3, 3], 13, [99], ['Robert']);
SELECT COUNT(*) FROM mt_with_pk WHERE x > toDateTime('2018-10-01 23:57:57');
SELECT sum(marks) FROM system.parts WHERE table = 'mt_with_pk' AND database = currentDatabase() AND active=1 AND database = currentDatabase();
INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 07:57:57'), [4, 4, 4], 14, [111, 222], ['Lui', 'Dave']), (toDate('2018-10-01'), toDateTime('2018-10-01 08:57:57'), [5, 5, 5], 15, [333, 444], ['John', 'Mike']), (toDate('2018-10-01'), toDateTime('2018-10-01 09:57:57'), [6, 6, 6], 16, [555, 666, 777], ['Alex', 'Jim', 'Tom']);
INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 05:57:57'), ['a', 'a', 'a'], 14, [888, 999], ['Jack', 'Elvis']);
SELECT sum(w) FROM mt_with_pk;
SELECT distinct(y) FROM mt_with_pk;
INSERT INTO mt_with_pk (d, x, y, z, `n.Age`, `n.Name`, w) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 03:57:57'), ['z', 'z', 'z'], 15, [1111, 2222], ['Garry', 'Ron'], 1);
SELECT COUNT(*) FROM mt_with_pk WHERE z + w > 5000;
DROP TABLE IF EXISTS alter_attach;
CREATE TABLE alter_attach (x UInt64, p UInt8) ENGINE = MergeTree ORDER BY tuple() PARTITION BY p  SETTINGS index_granularity_bytes=10000, write_final_mark=1;
INSERT INTO alter_attach VALUES (1, 1), (2, 1), (3, 1);
INSERT INTO alter_attach VALUES (4, 2, 'Hello'), (5, 2, 'World');
SELECT * FROM alter_attach ORDER BY x;
INSERT INTO alter_attach VALUES (6, 3), (7, 3);
DROP TABLE IF EXISTS alter_update_00806;
CREATE TABLE alter_update_00806 (d Date, e Enum8('foo'=1, 'bar'=2)) Engine = MergeTree PARTITION BY d ORDER BY (d) SETTINGS index_granularity_bytes=10000, write_final_mark=1;
INSERT INTO alter_update_00806 (d, e) VALUES ('2018-01-01', 'foo');
INSERT INTO alter_update_00806 (d, e) VALUES ('2018-01-02', 'bar');
SELECT e FROM alter_update_00806 ORDER BY d;
DROP TABLE IF EXISTS mt_without_pk;
CREATE TABLE mt_without_pk (
  d Date DEFAULT '2000-01-01',
  x DateTime,
  y Array(UInt64),
  z UInt64,
  n Nested (Age UInt8, Name String),
  w Int16 DEFAULT 10
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(d) ORDER BY tuple() SETTINGS index_granularity_bytes=10000, write_final_mark=1;
INSERT INTO mt_without_pk (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 12:57:57'), [1, 1, 1], 11, [77], ['Joe']), (toDate('2018-10-01'), toDateTime('2018-10-01 16:57:57'), [2, 2, 2], 12, [88], ['Mark']), (toDate('2018-10-01'), toDateTime('2018-10-01 19:57:57'), [3, 3, 3], 13, [99], ['Robert']);
SELECT COUNT(*) FROM mt_without_pk WHERE x > toDateTime('2018-10-01 23:57:57');
SELECT sum(marks) FROM system.parts WHERE table = 'mt_without_pk' AND active=1 AND database = currentDatabase();
INSERT INTO mt_without_pk (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 07:57:57'), [4, 4, 4], 14, [111, 222], ['Lui', 'Dave']), (toDate('2018-10-01'), toDateTime('2018-10-01 08:57:57'), [5, 5, 5], 15, [333, 444], ['John', 'Mike']), (toDate('2018-10-01'), toDateTime('2018-10-01 09:57:57'), [6, 6, 6], 16, [555, 666, 777], ['Alex', 'Jim', 'Tom']);
DROP TABLE IF EXISTS mt_with_small_granularity;
CREATE TABLE mt_with_small_granularity (
  d Date DEFAULT '2000-01-01',
  x DateTime,
  y Array(UInt64),
  z UInt64,
  n Nested (Age UInt8, Name String),
  w Int16 DEFAULT 10
) ENGINE = MergeTree()
PARTITION BY toYYYYMM(d) ORDER BY (x, z) SETTINGS index_granularity_bytes=30, min_index_granularity_bytes=20, write_final_mark=1;
INSERT INTO mt_with_small_granularity (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 12:57:57'), [1, 1, 1], 11, [77], ['Joe']), (toDate('2018-10-01'), toDateTime('2018-10-01 16:57:57'), [2, 2, 2], 12, [88], ['Mark']), (toDate('2018-10-01'), toDateTime('2018-10-01 19:57:57'), [3, 3, 3], 13, [99], ['Robert']);
SELECT COUNT(*) FROM mt_with_small_granularity WHERE x > toDateTime('2018-10-01 23:57:57');
SELECT sum(marks) FROM system.parts WHERE table = 'mt_with_small_granularity' AND active=1 AND database = currentDatabase();
INSERT INTO mt_with_small_granularity (d, x, y, z, `n.Age`, `n.Name`) VALUES (toDate('2018-10-01'), toDateTime('2018-10-01 07:57:57'), [4, 4, 4], 14, [111, 222], ['Lui', 'Dave']), (toDate('2018-10-01'), toDateTime('2018-10-01 08:57:57'), [5, 5, 5], 15, [333, 444], ['John', 'Mike']), (toDate('2018-10-01'), toDateTime('2018-10-01 09:57:57'), [6, 6, 6], 16, [555, 666, 777], ['Alex', 'Jim', 'Tom']);
