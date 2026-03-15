CREATE TABLE 03720_test (k1 UInt64, k2 UInt64, val UInt64) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(1) == 100 FROM 03720_test;    -- Full scan
SELECT COUNT(1) == 5 FROM 03720_test WHERE k1 = 5 AND k2 IN (15, 35, 55, 75, 95);   -- Key scan
SELECT COUNT(1) == 0 FROM 03720_test WHERE k1 = 6 AND k2 IN (15, 35, 55, 75, 95);
SELECT COUNT(1) == 1 FROM 03720_test WHERE k1 IN (1, 3, 5) AND k2 = 15 AND k1 IN (3, 5, 7);
SELECT COUNT(1) == 0 FROM 03720_test WHERE k1 IN (1, 3, 5) AND k2 = 15 AND k1 IN (2, 4, 6);
SELECT COUNT(1) == 6 FROM 03720_test WHERE (k1 IN (1, 3, 5) OR k1 IN (2, 3, 4, 5, 6)) AND k2 IN (11, 13, 15, 12, 14, 16);
CREATE TABLE 03720_tuple_equality (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_tuple_equality WHERE (k1, k2) = (1, 10) ORDER BY val;
SELECT val FROM 03720_tuple_equality WHERE (k1, k2) = (2, 20) ORDER BY val;
SELECT COUNT(*) FROM 03720_tuple_equality WHERE (k1, k2) = (3, 30); -- non-existent
SELECT COUNT(*) FROM 03720_tuple_equality WHERE k1 = 1 AND k2 IN ();
CREATE TABLE 03720_tuple_in (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_tuple_in WHERE (k1, k2) IN ((1, 10), (2, 20), (3, 30)) ORDER BY val;
SELECT COUNT(*) FROM 03720_tuple_in WHERE (k1, k2) IN ((1, 10), (5, 50)); -- partial match
CREATE TABLE 03720_three_columns (k1 UInt32, k2 UInt32, k3 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
SELECT val FROM 03720_three_columns WHERE (k1, k2, k3) = (1, 1, 1) ORDER BY val;
SELECT val FROM 03720_three_columns WHERE (k1, k2, k3) IN ((1, 1, 1), (2, 1, 1)) ORDER BY val;
SELECT COUNT(*) FROM 03720_three_columns WHERE k1 = 1 AND k2 = 1 AND k3 IN (1, 2); -- Cartesian with 3 keys
SELECT COUNT(*) FROM 03720_three_columns WHERE (k1 = 1 AND k2 = 1 AND k3 = 1) OR (k1 = 1 AND k2 = 2 AND k3 = 1); -- OR with all 3 keys specified
CREATE TABLE 03720_four_columns (k1 UInt32, k2 UInt32, k3 UInt32, k4 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3, k4);
SELECT val FROM 03720_four_columns WHERE (k1, k2, k3, k4) = (1, 2, 3, 4);
SELECT COUNT(*) FROM 03720_four_columns WHERE k1 = 1 AND k2 = 2 AND k3 = 3 AND k4 IN (4, 5);
CREATE TABLE 03720_string_keys (k1 String, k2 String, val UInt32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_string_keys WHERE (k1, k2) = ('foo', 'bar') ORDER BY val;
SELECT val FROM 03720_string_keys WHERE k1 = 'foo' AND k2 IN ('bar', 'baz') ORDER BY val;
SELECT COUNT(*) FROM 03720_string_keys WHERE (k1, k2) IN (('foo', 'bar'), ('qux', 'bar'));
CREATE TABLE 03720_mixed_types (k1 UInt64, k2 String, val Float32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_mixed_types WHERE (k1, k2) = (100, 'a') ORDER BY val;
SELECT val FROM 03720_mixed_types WHERE k1 = 100 AND k2 IN ('a', 'b') ORDER BY val;
CREATE TABLE 03720_datetime (k1 UInt32, k2 DateTime, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_datetime WHERE (k1, k2) = (1, '2024-01-01 00:00:00');
CREATE TABLE 03720_enum (k1 Enum8('a'=1, 'b'=2), k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_enum WHERE (k1, k2) = ('a', 1);
CREATE TABLE 03720_single_column (k1 UInt64, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY k1;
SELECT val FROM 03720_single_column WHERE k1 = 1 ORDER BY val;
SELECT val FROM 03720_single_column WHERE k1 IN (1, 3) ORDER BY val;
CREATE TABLE 03720_cartesian (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_cartesian WHERE k1 IN (0, 1, 2, 3, 4) AND k2 IN (0, 1, 2);
SELECT COUNT(*) FROM 03720_cartesian WHERE k1 = 5 AND k2 IN (0, 1, 2, 3, 4);
CREATE TABLE 03720_large_cartesian (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_large_cartesian WHERE k1 IN (0,1,2,3,4,5,6,7,8,9) AND k2 IN (0,1,2,3,4,5,6,7,8,9);
CREATE TABLE 03720_empty_results (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_empty_results WHERE (k1, k2) = (2, 2);
SELECT COUNT(*) FROM 03720_empty_results WHERE (k1, k2) IN ((2, 2), (3, 3));
SELECT COUNT(*) FROM 03720_empty_results WHERE k1 = 1 AND k2 = 2;
CREATE TABLE 03720_complex_or (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_complex_or WHERE (k1 = 1 AND k2 = 1) OR (k1 = 2 AND k2 = 2);
SELECT COUNT(*) FROM 03720_complex_or WHERE (k1, k2) IN ((1, 1), (2, 2));
CREATE TABLE 03720_mutations (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_mutations WHERE (k1, k2) = (1, 1) ORDER BY val;
CREATE TABLE 03720_partial_key (k1 UInt32, k2 UInt32, k3 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
-- Only k1 specified - should trigger full scan
SELECT COUNT(*) FROM 03720_partial_key WHERE k1 = 1;
CREATE TABLE 03720_deletes (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_deletes; -- Should be 4
SELECT val FROM 03720_deletes WHERE k1 = 1 ORDER BY val; -- Should be 'b'
SELECT val FROM 03720_deletes WHERE k1 = 2 ORDER BY val; -- Should be 'c'
SELECT val FROM 03720_deletes ORDER BY val; -- Should be 'c'
CREATE TABLE 03720_deletes_three_col (k1 UInt32, k2 UInt32, k3 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
SELECT COUNT(*) FROM 03720_deletes_three_col; -- Should be 3
SELECT val FROM 03720_deletes_three_col ORDER BY val; -- Should be 'c'
CREATE TABLE 03720_deletes_string (k1 String, k2 String, val UInt32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT COUNT(*) FROM 03720_deletes_string; -- Should be 2
SELECT val FROM 03720_deletes_string WHERE k1 = 'foo' ORDER BY val; -- Should be 2
CREATE TABLE 03720_updates (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_updates WHERE (k1, k2) = (1, 1); -- Should be 'updated'
SELECT val FROM 03720_updates WHERE (k1, k2) = (1, 2); -- Should be 'modified'
SELECT val FROM 03720_updates WHERE (k1, k2) = (2, 1); -- Should be 'test'
SELECT COUNT(*) FROM 03720_updates; -- Should be 3
CREATE TABLE 03720_updates_three_col (k1 UInt32, k2 UInt32, k3 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
SELECT val FROM 03720_updates_three_col WHERE (k1, k2, k3) = (1, 1, 1); -- Should be 'updated_v1'
SELECT COUNT(*) FROM 03720_updates_three_col; -- Should be 3
CREATE TABLE 03720_updates_string (k1 String, k2 String, val UInt32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_updates_string WHERE (k1, k2) = ('foo', 'bar'); -- Should be 999
SELECT COUNT(*) FROM 03720_updates_string; -- Should be 2
CREATE TABLE 03720_upsert (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT val FROM 03720_upsert WHERE (k1, k2) = (1, 1); -- Should be 'upserted'
SELECT val FROM 03720_upsert WHERE (k1, k2) = (2, 2); -- Should be 'new'
SELECT COUNT(*) FROM 03720_upsert; -- Should be 3
-- JOIN operations with multi-column primary keys
SET join_algorithm = 'direct, hash';
CREATE TABLE 03720_join_left (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
CREATE TABLE 03720_join_right (k1 UInt32, k2 UInt32, info String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
-- INNER JOIN on multi-column keys
SELECT l.val, r.info
FROM 03720_join_left AS l
INNER JOIN 03720_join_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2
ORDER BY l.val;
-- LEFT JOIN on multi-column keys
SELECT l.val, r.info
FROM 03720_join_left AS l
LEFT JOIN 03720_join_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2
ORDER BY l.val;
-- COUNT with INNER JOIN
SELECT COUNT(*) FROM 03720_join_left AS l
INNER JOIN 03720_join_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2;
CREATE TABLE 03720_join_three_left (k1 UInt32, k2 UInt32, k3 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
CREATE TABLE 03720_join_three_right (k1 UInt32, k2 UInt32, k3 UInt32, info String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2, k3);
SELECT l.val, r.info
FROM 03720_join_three_left AS l
INNER JOIN 03720_join_three_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2 AND l.k3 = r.k3
ORDER BY l.val;
SELECT COUNT(*) FROM 03720_join_three_left AS l
LEFT JOIN 03720_join_three_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2 AND l.k3 = r.k3;
CREATE TABLE 03720_join_str_left (k1 String, k2 String, val UInt32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
CREATE TABLE 03720_join_str_right (k1 String, k2 String, val UInt32) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
SELECT l.val, r.val
FROM 03720_join_str_left AS l
INNER JOIN 03720_join_str_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2
ORDER BY l.val;
SELECT COUNT(*) FROM 03720_join_str_left AS l
LEFT JOIN 03720_join_str_right AS r ON l.k1 = r.k1 AND l.k2 = r.k2;
CREATE TABLE 03720_join_rocks (k1 UInt32, k2 UInt32, val String) ENGINE=EmbeddedRocksDB PRIMARY KEY (k1, k2);
CREATE TABLE 03720_join_merge (k1 UInt32, k2 UInt32, info String) ENGINE=MergeTree() ORDER BY (k1, k2);
SELECT r.val, m.info
FROM 03720_join_rocks AS r
INNER JOIN 03720_join_merge AS m ON r.k1 = m.k1 AND r.k2 = m.k2
ORDER BY r.val;
SELECT COUNT(*) FROM 03720_join_rocks AS r
LEFT JOIN 03720_join_merge AS m ON r.k1 = m.k1 AND r.k2 = m.k2;
