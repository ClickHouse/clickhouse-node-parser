SELECT value == 'direct,parallel_hash,hash' FROM system.settings WHERE name = 'join_algorithm';
SELECT countIf(explain like '%Algorithm: DirectKeyValueJoin%'), countIf(explain like '%Algorithm: HashJoin%') FROM (
    EXPLAIN PLAN actions = 1
    SELECT * FROM ( SELECT k AS key FROM t2 ) AS t2
    INNER JOIN rdb ON rdb.key = t2.key
    ORDER BY key ASC
);
SELECT value == 'direct,hash' FROM system.settings WHERE name = 'join_algorithm';
SELECT value == 'hash,direct' FROM system.settings WHERE name = 'join_algorithm';
SELECT value == 'grace_hash,hash' FROM system.settings WHERE name = 'join_algorithm';
SELECT countIf(explain like '%Algorithm: GraceHashJoin%'), countIf(explain like '%Algorithm: HashJoin%') FROM (
    EXPLAIN PLAN actions = 1
    SELECT * FROM ( SELECT number AS key, number * 10 AS key2 FROM numbers_mt(10) ) AS t1
    JOIN ( SELECT k AS key, k + 100 AS key2 FROM t2 ) AS t2 ON t1.key = t2.key OR t1.key2 = t2.key2
);
SELECT countIf(explain like '%Algorithm: GraceHashJoin%'), countIf(explain like '%Algorithm: HashJoin%') FROM (
    EXPLAIN PLAN actions = 1
    SELECT * FROM ( SELECT number AS key, number * 10 AS key2 FROM numbers_mt(10) ) AS t1
    JOIN ( SELECT k AS key, k + 100 AS key2 FROM t2 ) AS t2 ON t1.key = t2.key
);
SELECT value = 'grace_hash,hash,auto' FROM system.settings WHERE name = 'join_algorithm';
SELECT countIf(explain like '%Algorithm: DirectKeyValueJoin%'), countIf(explain like '%Algorithm: HashJoin%') FROM (
    EXPLAIN actions = 1
    SELECT s FROM (SELECT toUInt64(9911) id) t1 INNER JOIN dict t2 USING (id)
);
-- Cannot execute the grace hash with OR condition
SELECT * FROM ( SELECT number AS key, number * 10 AS key2 FROM numbers_mt(10) ) AS t1
JOIN ( SELECT k AS key, k + 100 AS key2 FROM t2 ) AS t2 ON t1.key = t2.key OR t1.key2 = t2.key2; -- { serverError NOT_IMPLEMENTED }
-- But for CROSS choose `hash` algorithm even though it's not enabled
SELECT * FROM ( SELECT number AS key, number * 10 AS key2 FROM numbers_mt(10) ) AS t1
CROSS JOIN ( SELECT k AS key, k + 100 AS key2 FROM t2 ) AS t2 FORMAT Null
SETTINGS enable_analyzer = 1;
-- ... (not for old analyzer)
SELECT * FROM ( SELECT number AS key, number * 10 AS key2 FROM numbers_mt(10) ) AS t1
CROSS JOIN ( SELECT k AS key, k + 100 AS key2 FROM t2 ) AS t2 FORMAT Null
SETTINGS enable_analyzer = 0; -- { serverError NOT_IMPLEMENTED }
