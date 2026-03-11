SELECT value2 = 1 as x, toTypeName(x)
FROM (
    SELECT *
    FROM tableA
    LEFT JOIN tableB ON tableB.key = tableA.key
    LEFT JOIN tableC AS t ON tableB.key = t.key
) ORDER BY 1;
SELECT value2 = 1 as x, toTypeName(x)
FROM (
    SELECT tableB.*
    FROM tableA
    LEFT JOIN tableB ON tableB.key = tableA.key
    LEFT JOIN tableC AS t ON tableB.key = t.key
) ORDER BY 1;
SELECT value2 = 1 as x, toTypeName(x)
FROM (
    SELECT tableB.*
    FROM tableA
    INNER JOIN tableB ON tableB.key = tableA.key
    LEFT JOIN tableC AS t ON tableB.key = t.key
) ORDER BY 1;
SELECT value2 = 1 as x, toTypeName(x)
FROM (
    SELECT tableB.*
    FROM tableA
    INNER JOIN tableB ON tableB.key = tableA.key
    RIGHT JOIN tableC AS t ON tableB.key = t.key
) ORDER BY 1;
