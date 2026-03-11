SELECT '---';

SELECT
    key,
    length(t1.s),
    length(t2.s)
FROM
    t1 AS t1
FULL JOIN tn2 AS t2
    USING (key)
ORDER BY
    key ASC,
    length(t1.s) ASC,
    length(t2.s) ASC;