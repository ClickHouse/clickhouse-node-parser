SELECT * FROM bar INNER JOIN foo USING id WHERE bar.seq > foo.seq SETTINGS final = 1;
-- { echo ON }
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 1 ORDER BY row SETTINGS enable_vertical_final = 0;
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 1 ORDER BY row SETTINGS enable_vertical_final = 1;
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 2 ORDER BY row SETTINGS enable_vertical_final = 0;
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 2 ORDER BY row SETTINGS enable_vertical_final = 1;
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 3 ORDER BY row SETTINGS enable_vertical_final = 0;
SELECT arrayJoin([(k1, v), (k2, v)]) AS row, row.1 as k FROM t FINAL WHERE k1 != 3 AND k = 3 ORDER BY row SETTINGS enable_vertical_final = 1;
