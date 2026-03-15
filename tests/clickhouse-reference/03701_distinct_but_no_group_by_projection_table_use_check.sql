CREATE TABLE tab (
  n UInt32, x UInt32, y UInt32, z UInt32,
  projection p (
    SELECT count()
    GROUP BY x, z
  )
) ENGINE = MergeTree
order by tuple();
SELECT DISTINCT x, z FROM tab;
SELECT DISTINCT z FROM tab;
SELECT DISTINCT x, y FROM tab;
SELECT DISTINCT x, z FROM tab WHERE x IN (1, 2) AND z < 5;
CREATE TABLE tab (
  n UInt32, x UInt32, y UInt32,
  projection p (
    SELECT count()
    GROUP BY x / 2, y % 10
  )
) ENGINE = MergeTree
order by tuple();
SELECT DISTINCT x / 2, y % 10 FROM tab;
SELECT DISTINCT x / 2 FROM tab;
SELECT DISTINCT x / 2, y FROM tab;
