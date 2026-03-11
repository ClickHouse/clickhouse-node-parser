SELECT id, val FROM t_skip_index_null WHERE val = 'a' ORDER BY id;
SELECT id, val FROM t_skip_index_null WHERE val IS NULL ORDER BY id;
SELECT count() FROM t_skip_index_null WHERE val = 'nonexistent';
