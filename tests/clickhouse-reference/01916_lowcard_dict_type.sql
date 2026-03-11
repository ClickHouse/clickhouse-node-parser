SELECT toIntervalMinute(lc) as e, toTypeName(e) FROM t1;
SELECT toIntervalDay(lc) as e, toTypeName(e) FROM t1;
SELECT toUUID(lc) as e, toTypeName(e) FROM t2;
SELECT toIntervalMinute(lc), toTypeName(materialize(r.lc)) FROM t1 AS l INNER JOIN t2 as r USING (lc);
