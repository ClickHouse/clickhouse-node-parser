SET output_format_pretty_color = 1;
SET enable_analyzer = 1;
CREATE TABLE table1(a String, b Date) ENGINE MergeTree order by a;
CREATE TABLE table2(c String, a String, d Date) ENGINE MergeTree order by c;
SELECT * FROM table1 t1 FORMAT PrettyCompact;
SELECT *, c as a, d as b FROM table2 FORMAT PrettyCompact;
SELECT * FROM table1 t1 ALL LEFT JOIN (SELECT *, c, d as b FROM table2) t2 USING (a, b) ORDER BY d, t1.a FORMAT PrettyCompact;
SELECT * FROM table1 t1 ALL INNER JOIN (SELECT *, c, d as b FROM table2) t2 USING (a, b) ORDER BY d, t1.a FORMAT PrettyCompact;
