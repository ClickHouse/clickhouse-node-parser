CREATE TABLE t1 (key UInt64, a UInt8, b String, c Float64) ENGINE = MergeTree() ORDER BY key;
CREATE DICTIONARY dict_flat (key UInt64 DEFAULT 0, a UInt8 DEFAULT 42, b String DEFAULT 'x', c Float64 DEFAULT 42.0)
PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE 't1'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(FLAT());
CREATE DICTIONARY dict_hashed (key UInt64 DEFAULT 0, a UInt8 DEFAULT 42, b String DEFAULT 'x', c Float64 DEFAULT 42.0)
PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE 't1'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(HASHED());
CREATE DICTIONARY dict_complex_cache (key UInt64 DEFAULT 0, a UInt8 DEFAULT 42, b String DEFAULT 'x', c Float64 DEFAULT 42.0)
PRIMARY KEY key, b
SOURCE(CLICKHOUSE(TABLE 't1'))
LIFETIME(MIN 1 MAX 10)
LAYOUT(COMPLEX_KEY_CACHE(SIZE_IN_CELLS 1));
SET join_use_nulls = 0;
SET join_algorithm = 'direct';
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 LEFT JOIN dict_flat d ON s1.key = d.key ORDER BY s1.key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 LEFT JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 ANY LEFT JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 SEMI JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 ANTI JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 JOIN dict_flat d USING(key);
SELECT * FROM (SELECT number AS k FROM numbers(100)) s1 JOIN dict_flat d ON k = key ORDER BY k;
SET join_use_nulls = 1;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 LEFT JOIN dict_hashed d ON s1.key = d.key ORDER BY s1.key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 LEFT JOIN dict_hashed d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 ANY LEFT JOIN dict_hashed d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 SEMI JOIN dict_hashed d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 ANTI JOIN dict_hashed d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 JOIN dict_hashed d USING(key);
SELECT * FROM (SELECT number AS k FROM numbers(100)) s1 JOIN dict_hashed d ON k = key ORDER BY k;
-- unsupported cases for dictionary join, falls back to regular join

SET join_algorithm = 'default';
SELECT * FROM (SELECT if(number % 2 = 0, number, number * 1000) AS k FROM numbers(100)) s1 JOIN dict_flat d ON k = key OR k == 1000 * key ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 ANY LEFT JOIN dict_flat d USING(key) ORDER BY key SETTINGS any_join_distinct_right_table_keys = '1';
SELECT * FROM (SELECT number AS key FROM numbers(5)) s1 LEFT JOIN dict_complex_cache d ON s1.key = d.key ORDER BY s1.key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 RIGHT JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 RIGHT JOIN dict_flat d ON s1.key = d.key ORDER BY d.key;
SELECT * FROM (SELECT number + 2 AS key FROM numbers(4)) s1 FULL JOIN dict_flat d USING(key) ORDER BY s1.key, d.key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 ANY INNER JOIN dict_flat d USING(key) ORDER BY s1.key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 ANY RIGHT JOIN dict_flat d USING(key) ORDER BY key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 SEMI RIGHT JOIN dict_flat d USING(key) ORDER BY s1.key;
SELECT * FROM (SELECT number AS key FROM numbers(2)) s1 ANTI RIGHT JOIN dict_flat d USING(key) ORDER BY key;
SET join_algorithm = 'auto';
SET join_algorithm = 'partial_merge';
