SELECT s1.other, s2.other, count_a, count_b, toTypeName(s1.other), toTypeName(s2.other) FROM
    ( SELECT other, count() AS count_a FROM table_a GROUP BY other ) s1
ALL FULL JOIN
    ( SELECT other, count() AS count_b FROM table_b GROUP BY other ) s2
ON s1.other = s2.other
ORDER BY s2.other DESC, count_a, s1.other;
SELECT s1.something, s2.something, count_a, count_b, toTypeName(s1.something), toTypeName(s2.something) FROM
    ( SELECT something, count() AS count_a FROM table_a GROUP BY something ) s1
ALL FULL JOIN
    ( SELECT something, count() AS count_b FROM table_b GROUP BY something ) s2
ON s1.something = s2.something
ORDER BY count_a DESC, something, s2.something;
SELECT s1.something, s2.something, count_a, count_b, toTypeName(s1.something), toTypeName(s2.something) FROM
    ( SELECT something, count() AS count_a FROM table_a GROUP BY something ) s1
ALL RIGHT JOIN
    ( SELECT something, count() AS count_b FROM table_b GROUP BY something ) s2
ON s1.something = s2.something
ORDER BY count_a DESC, s1.something, s2.something;
SELECT something, count_a, count_b, toTypeName(something) FROM
    ( SELECT something, count() AS count_a FROM table_a GROUP BY something ) as s1
ALL FULL JOIN
    ( SELECT something, count() AS count_b FROM table_b GROUP BY something ) as s2
ON s1.something = s2.something
ORDER BY count_a DESC, something DESC;
