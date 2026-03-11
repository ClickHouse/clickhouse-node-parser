SELECT * FROM table1 t1 FORMAT PrettyCompact;
SELECT *, c as a, d as b FROM table2 FORMAT PrettyCompact;
SELECT * FROM table1 t1 ALL LEFT JOIN (SELECT *, c, d as b FROM table2) t2 USING (a, b) ORDER BY d, t1.a FORMAT PrettyCompact;
SELECT * FROM table1 t1 ALL INNER JOIN (SELECT *, c, d as b FROM table2) t2 USING (a, b) ORDER BY d, t1.a FORMAT PrettyCompact;
