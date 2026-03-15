CREATE TABLE t1 (`x` UInt32, `lc` LowCardinality(String) ) ENGINE = Memory;
SELECT toIntervalMinute(lc) as e, toTypeName(e) FROM t1;
SELECT toIntervalDay(lc) as e, toTypeName(e) FROM t1;
CREATE TABLE t2 (`x` UInt32, `lc` LowCardinality(String) ) ENGINE = Memory;
SELECT toUUID(lc) as e, toTypeName(e) FROM t2;
SELECT toIntervalMinute(lc), toTypeName(materialize(r.lc)) FROM t1 AS l INNER JOIN t2 as r USING (lc);
