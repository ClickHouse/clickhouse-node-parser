-- Test SELECT * REPLACE with all SQL clauses using new analyzer
-- This test verifies comprehensive fix for SELECT * REPLACE in all applicable clauses
-- See issue: https://github.com/ClickHouse/ClickHouse/issues/85313
-- See PR: https://github.com/ClickHouse/ClickHouse/pull/87630

SET allow_experimental_analyzer = 1;
-- Setup test tables
DROP TABLE IF EXISTS test_replace_main;
DROP TABLE IF EXISTS test_replace_merge;
CREATE TABLE test_replace_main (id UInt32, a UInt32, b UInt32, c String) ENGINE = Memory;
INSERT INTO test_replace_main VALUES (1, 100, 200, 'alpha'), (2, 300, 100, 'beta'), (3, 200, 300, 'gamma');
CREATE TABLE test_replace_merge (id UInt32, a UInt32, b UInt32) ENGINE = MergeTree ORDER BY id;
INSERT INTO test_replace_merge VALUES (1, 100, 200), (2, 300, 100), (3, 200, 300);
SELECT * REPLACE(a AS b) FROM test_replace_main WHERE b > 150 ORDER BY id;
DROP TABLE IF EXISTS test_arith;
CREATE TABLE test_arith (a UInt32, b UInt32) ENGINE = Memory;
INSERT INTO test_arith VALUES (1, 2), (2, 4);
SELECT * REPLACE(a + 10 AS b) FROM test_arith WHERE b = 11;
SELECT * REPLACE(a + 10 AS b) FROM test_arith WHERE b = 12;
SELECT * REPLACE(a * 10 + a AS b) FROM test_arith WHERE b = 11;
-- Test 1b: String replacement in WHERE
DROP TABLE IF EXISTS test_replace_str;
CREATE TABLE test_replace_str (id UInt32, s String) ENGINE = Memory;
INSERT INTO test_replace_str VALUES (1, 'hello'), (2, 'world');
SELECT * REPLACE(s || '_suffix' AS s) FROM test_replace_str WHERE s = 'hello_suffix';
DROP TABLE test_arith;
DROP TABLE test_replace_str;
SELECT * REPLACE(a AS b) FROM test_replace_main ORDER BY b;
SELECT * REPLACE(a AS b) FROM test_replace_main ORDER BY b DESC, id;
SELECT * REPLACE(a AS b) FROM test_replace_merge PREWHERE b > 150 ORDER BY id;
DROP TABLE IF EXISTS test_limit_by;
CREATE TABLE test_limit_by (id UInt32, a UInt32, b UInt32) ENGINE = Memory;
INSERT INTO test_limit_by VALUES (1, 100, 200), (2, 100, 300), (3, 200, 400), (4, 200, 500);
SELECT * REPLACE(a AS b) FROM test_limit_by ORDER BY id LIMIT 1 BY b < 200;
DROP TABLE test_limit_by;
SELECT * REPLACE(a AS b), ROW_NUMBER() OVER (ORDER BY b) as rn
FROM test_replace_main
ORDER BY id;
SELECT * REPLACE(a * 2 + 10 AS b) FROM test_replace_main WHERE b > 250 ORDER BY id;
SELECT * REPLACE(a AS b, 'replaced_' || c AS c)
FROM test_replace_main
WHERE b > 150
ORDER BY id;
SELECT * FROM (
    SELECT * REPLACE(a AS b) FROM test_replace_main WHERE b > 150
) ORDER BY id;
SELECT * REPLACE(c || '_suffix' AS c)
FROM test_replace_main
WHERE c = 'beta_suffix'
ORDER BY id;
SELECT * REPLACE(a AS b) FROM test_replace_main
WHERE b > 150
ORDER BY b
LIMIT 2;
SELECT * REPLACE(a + 100 AS b) FROM test_replace_main WHERE b + 50 > 200 ORDER BY b;
DROP TABLE IF EXISTS test_group_by;
CREATE TABLE test_group_by (id UInt32, category String, value UInt32) ENGINE = Memory;
INSERT INTO test_group_by VALUES (1, 'A', 10), (2, 'A', 20), (3, 'B', 30), (4, 'B', 40);
SELECT category, sum(value) as total
FROM (SELECT * REPLACE(value * 10 AS value) FROM test_group_by)
GROUP BY category
ORDER BY category;
DROP TABLE test_group_by;
DROP TABLE IF EXISTS test_group_by_sub;
CREATE TABLE test_group_by_sub (category String, value UInt32) ENGINE = Memory;
INSERT INTO test_group_by_sub VALUES ('A', 10), ('A', 20), ('B', 30), ('B', 40);
SELECT category, total
FROM (
    SELECT category || '_modified' AS category, sum(value) as total
    FROM test_group_by_sub
    GROUP BY category
)
ORDER BY category;
DROP TABLE test_group_by_sub;
DROP TABLE IF EXISTS test_group_by_direct;
CREATE TABLE test_group_by_direct (category String, value UInt32) ENGINE = Memory;
INSERT INTO test_group_by_direct VALUES ('A', 10), ('A', 20), ('B', 30), ('B', 40);
SELECT category || '_modified' AS category, sum(value) as total
FROM test_group_by_direct
GROUP BY category
ORDER BY category;
DROP TABLE test_group_by_direct;
DROP TABLE IF EXISTS test_having;
CREATE TABLE test_having (id UInt32, category String, amount UInt32) ENGINE = Memory;
INSERT INTO test_having VALUES (1, 'X', 50), (2, 'X', 75), (3, 'Y', 100), (4, 'Y', 125);
SELECT category, sum(amount) as total
FROM (SELECT * REPLACE(amount + 100 AS amount) FROM test_having)
GROUP BY category
HAVING total > 200
ORDER BY category;
DROP TABLE test_having;
DROP TABLE IF EXISTS test_having_sub;
CREATE TABLE test_having_sub (category String, amount UInt32) ENGINE = Memory;
INSERT INTO test_having_sub VALUES ('X', 50), ('X', 75), ('Y', 100), ('Y', 125);
SELECT category, total
FROM (
    SELECT category, sum(amount + 100) as total
    FROM test_having_sub
    GROUP BY category
    HAVING total > 200
)
ORDER BY category;
DROP TABLE test_having_sub;
DROP TABLE IF EXISTS test_having_direct;
CREATE TABLE test_having_direct (category String, amount UInt32) ENGINE = Memory;
INSERT INTO test_having_direct VALUES ('X', 50), ('X', 75), ('Y', 100), ('Y', 125);
SELECT category, sum(amount + 100) as total
FROM test_having_direct
GROUP BY category
HAVING total > 200
ORDER BY category;
DROP TABLE test_having_direct;
-- Cleanup
DROP TABLE test_replace_main;
DROP TABLE test_replace_merge;
