SET join_use_nulls = 1;
SET enable_analyzer = 1;
SET join_algorithm = 'parallel_hash';
SET query_plan_join_swap_table = 0;
CREATE TABLE t_l_small (id UInt32, value String) ENGINE = Memory;
CREATE TABLE t_r_small (id UInt32, description String) ENGINE = Memory;
INSERT INTO t_l_small VALUES (1, 'A'), (2, 'B'), (3, 'C');
INSERT INTO t_r_small VALUES (2, 'Second'), (3, 'Third'), (4, 'Fourth'), (5, 'Fifth');
SELECT l.id, l.value, r.description
FROM t_l_small AS l
RIGHT JOIN t_r_small AS r ON l.id = r.id
ORDER BY r.id, l.id;
SELECT l.id, l.value, r.description
FROM t_l_small AS l
FULL OUTER JOIN t_r_small AS r ON l.id = r.id
ORDER BY coalesce(l.id, r.id), r.id;
CREATE TABLE t_l_any (id UInt32, value String) ENGINE = Memory;
CREATE TABLE t_r_any (id UInt32, description String) ENGINE = Memory;
INSERT INTO t_l_any VALUES (2, 'B'), (2, 'B'), (3, 'C'), (10, 'X');
INSERT INTO t_r_any VALUES (2, 'Second'), (3, 'Third'), (4, 'Fourth');
SELECT
    count(),
    countIf(isNull(l.value))
FROM t_l_any AS l
RIGHT ANY JOIN t_r_any AS r ON l.id = r.id;
CREATE TABLE t_l_filter (id UInt32, value String) ENGINE = Memory;
CREATE TABLE t_r_filter (id UInt32, description String) ENGINE = Memory;
INSERT INTO t_l_filter VALUES (2, 'B'), (3, 'C'), (4, 'D');
INSERT INTO t_r_filter VALUES (2, 'Second'), (3, 'Third'), (4, 'Fourth');
SELECT l.id, l.value, r.description
FROM t_l_filter AS l
RIGHT JOIN t_r_filter AS r ON l.id = r.id AND r.description LIKE 'F%'
ORDER BY r.id;
CREATE TABLE t_l_null (id UInt32, v String) ENGINE = Memory;
CREATE TABLE t_r_null (id Nullable(UInt32), d String) ENGINE = Memory;
INSERT INTO t_l_null VALUES (1, 'A'), (2, 'B');
INSERT INTO t_r_null VALUES (1, 'one'), (NULL, 'null1'), (3, 'three');
SELECT l.id, l.v, r.d
FROM t_l_null AS l
RIGHT JOIN t_r_null AS r ON l.id = r.id
ORDER BY r.d;
CREATE TABLE t_l_cmp (id UInt32, grp UInt8, val String) ENGINE = Memory;
CREATE TABLE t_r_cmp (id UInt32, grp UInt8, descr String) ENGINE = Memory;
INSERT INTO t_l_cmp VALUES (1, 1, 'a'), (1, 2, 'b'), (2, 1, 'c');
INSERT INTO t_r_cmp VALUES (1, 1, 'r11'), (2, 1, 'r21'), (3, 1, 'r31');
SELECT l.id, l.grp, l.val, r.descr
FROM t_l_cmp AS l
RIGHT JOIN t_r_cmp AS r ON (l.id = r.id) AND (l.grp = r.grp)
ORDER BY r.id, r.grp;
SELECT
    count(),
    countIf(isNull(l.id)),
    sum(coalesce(l.id, 0)),
    sum(r.id)
FROM
    (SELECT number AS id FROM numbers(15000)) AS l
RIGHT JOIN
    (SELECT number AS id FROM numbers(20000)) AS r
ON l.id = r.id;
SELECT
    count(),
    countIf(isNull(l.id)),   -- right-only
    countIf(isNull(r.id))    -- left-only
FROM
    (SELECT number AS id FROM numbers(15000)) AS l
FULL OUTER JOIN
    (SELECT number AS id FROM numbers(15500)) AS r
ON l.id = r.id;
SET allow_experimental_analyzer = 1;
CREATE TABLE l (k UInt8, v UInt8) ENGINE = Memory;
CREATE TABLE r (k UInt8, v UInt8) ENGINE = Memory;
INSERT INTO l SELECT toUInt8(number), toUInt8(number) FROM numbers(200);
INSERT INTO r SELECT toUInt8(number), toUInt8(number) FROM numbers(200);
SET max_threads = 8;
SET join_algorithm = 'hash';
SELECT 'hash' AS alg, count() AS cnt
FROM l RIGHT JOIN r ON l.k = r.k AND l.v > r.v;
SELECT 'parallel_hash' AS alg, count() AS cnt
FROM l RIGHT JOIN r ON l.k = r.k AND l.v > r.v;
SELECT 'hash right-only', countIf(l.k IS NULL) FROM l RIGHT JOIN r ON l.k = r.k AND l.v > r.v;
SELECT 'parallel right-only', countIf(l.k IS NULL) FROM l RIGHT JOIN r ON l.k = r.k AND l.v > r.v;
SELECT 'hash', count() FROM l FULL OUTER JOIN r ON l.k = r.k AND l.v > r.v;
SELECT 'parallel_hash', count() FROM l FULL OUTER JOIN r ON l.k = r.k AND l.v > r.v;
