SELECT a FROM ( SELECT key + 1 as a, key FROM t1 GROUP BY key ) WHERE key FORMAT Null;
SELECT key FROM ( SELECT key FROM t1 GROUP BY key ) t1 JOIN (SELECT key FROM t2) t2 ON t1.key = t2.key WHERE key FORMAT Null;
