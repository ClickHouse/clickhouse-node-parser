CREATE TABLE t_map_null (a Map(String, String), b String) engine = MergeTree() ORDER BY a;
SELECT count() FROM t_map_null WHERE a = map('name', NULL, '', NULL);
