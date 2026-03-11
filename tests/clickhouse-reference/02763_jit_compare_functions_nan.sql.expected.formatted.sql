SELECT
    t1.id,
    t2.id
FROM
    test_table_1 AS t1
RIGHT JOIN test_table_2 AS t2
    ON (t1.id = t2.id)
WHERE (acos(t2.id) <> atan(t1.id))
    AND (NOT acos(t2.id) <> atan(t1.id));

SELECT '--';

SELECT (acos(a) <> atan(b))
    AND (NOT acos(a) <> atan(b)) AS r
FROM (
        SELECT
            2 AS a,
            2 AS b
    );