CREATE TABLE tab ( `k` Nullable(UInt32), `k1` Nullable(UInt32), `k2` Nullable(UInt32), `v` String ) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE mem ( `k` UInt64, `v` String ) ENGINE = Join(ANY, LEFT, k);
CREATE TABLE mem2 ( `k` UInt64, `v` String ) ENGINE = Join(ANY, RIGHT, k);
CREATE TABLE mem3 ( `k` UInt64, `v` String ) ENGINE = Join(ALL, FULL, k) SETTINGS join_use_nulls = 1;
CREATE TABLE mem4 ( `k1` UInt64, `k2` UInt64, `v` String ) ENGINE = Join(ALL, FULL, k1, k2);
SET enable_analyzer = 1;
SELECT '-----';
SELECT *
FROM tab
ANY LEFT JOIN mem ON k1 = mem.k
ANY LEFT JOIN mem AS t ON k2 = t.k
ORDER BY tab.v
;
SELECT *
FROM tab
ANY LEFT JOIN mem ON k1 = mem.k
ANY RIGHT JOIN mem2 ON k2 = mem2.k
ORDER BY tab.v
;
SELECT *
FROM tab
FULL JOIN mem3 AS t1 ON k1 = t1.k
FULL JOIN mem3 AS t2 ON k2 = t2.k
ORDER BY tab.v
SETTINGS join_use_nulls = 1
;
SELECT *
FROM tab
FULL JOIN mem4 AS t1 ON tab.k1 = t1.k1 AND tab.k2 = t1.k2
FULL JOIN mem4 AS t2 ON tab.k1 = t2.k1 AND tab.k2 = t2.k2
ORDER BY tab.v
;
SELECT *
FROM tab
FULL JOIN mem4 AS t1 USING (k1, k2)
FULL JOIN mem4 AS t2 USING (k1, k2)
ORDER BY tab.v
;
SELECT count() FROM (
    EXPLAIN PLAN
    SELECT * FROM tab
    ANY LEFT JOIN mem AS t1 ON tab.k = t1.k
    ANY LEFT JOIN mem AS t2 ON tab.k = t2.k
    ANY LEFT JOIN mem AS t3 ON tab.k = t3.k
    ANY LEFT JOIN mem AS t4 ON tab.k = t4.k
    ANY RIGHT JOIN mem2 AS t5 ON tab.k = t5.k
    ANY LEFT JOIN mem AS t6 ON tab.k = t6.k
    ANY LEFT JOIN mem AS t7 ON tab.k = t7.k
)
WHERE explain like '%FilledJoin%'
;
