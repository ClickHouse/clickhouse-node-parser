SELECT '-- key rename';
SELECT * FROM (SELECT k as key FROM t2) as t2 INNER JOIN rdb ON rdb.key == t2.key ORDER BY key;
SELECT * FROM (SELECT k as key FROM t2) as t2 INNER JOIN rdb USING key ORDER BY key;
SELECT k FROM t2 LEFT SEMI JOIN rdb ON rdb.key == t2.k ORDER BY k;
SELECT k FROM t2 LEFT ANTI JOIN rdb ON rdb.key == t2.k ORDER BY k;
SELECT k, key, toTypeName(value2), value2 FROM t2 LEFT JOIN rdb ON rdb.key == t2.k ORDER BY k SETTINGS join_use_nulls = 1;
SELECT k, key, toTypeName(value2), value2 FROM t2 INNER JOIN rdb ON rdb.key == t2.k ORDER BY k SETTINGS join_use_nulls = 1;
SELECT value2 FROM t2 LEFT JOIN rdb ON rdb.key == t2.k ORDER BY k;
SELECT * FROM t2 INNER JOIN rdb ON rdb.key == t2.k ORDER BY rdb.key;
-- can't promote right table type
SELECT * FROM (SELECT toUInt64(k) as k FROM t2) as t2 INNER JOIN rdb ON rdb.key == t2.k; -- { serverError NOT_IMPLEMENTED,TYPE_MISMATCH }
SELECT rdb.key % 2, sum(k), max(value2) FROM t2 INNER JOIN rdb ON rdb.key == t2.k GROUP BY (rdb.key % 2) WITH TOTALS;
SELECT * FROM t1 RIGHT JOIN rdb ON rdb.key == t1.k; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 RIGHT JOIN rdb ON rdb.key == t1.k FORMAT Null SETTINGS join_algorithm = 'direct,hash';
SELECT * FROM t1 FULL JOIN rdb ON rdb.key == t1.k; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 FULL JOIN rdb ON rdb.key == t1.k FORMAT Null SETTINGS join_algorithm = 'direct,hash';
SELECT * FROM t1 INNER JOIN rdb ON rdb.key + 1 == t1.k; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 INNER JOIN rdb ON rdb.key + 1 == t1.k FORMAT Null SETTINGS join_algorithm = 'direct,hash';
SELECT * FROM t1 INNER JOIN (SELECT * FROM rdb) AS rdb ON rdb.key == t1.k; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 INNER JOIN (SELECT * FROM rdb) AS rdb ON rdb.key == t1.k FORMAT Null SETTINGS join_algorithm = 'direct,hash';
SELECT * FROM t1 RIGHT SEMI JOIN (SELECT * FROM rdb) AS rdb ON rdb.key == t1.k; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 RIGHT ANTI JOIN (SELECT * FROM rdb) AS rdb ON rdb.key == t1.k; -- { serverError NOT_IMPLEMENTED }
