SELECT * FROM defaults ORDER BY (x, y);
SELECT * FROM defaults WHERE x = 7 FORMAT JSONEachRow;
SELECT * FROM defaults WHERE x > 7 ORDER BY x FORMAT JSONEachRow;
