SELECT *
FROM
    v1 AS t1
INNER JOIN v1 AS t2
    USING (id)
INNER JOIN v2 AS n1
    ON t1.id = n1.value
INNER JOIN v2 AS n2
    ON t1.id = n2.value;

SELECT '---';

SELECT *
FROM
    v1 AS t1
INNER JOIN v1 AS t2
    USING (id)
CROSS JOIN v2 AS n1
CROSS JOIN v2 AS n2;

SELECT *
FROM
    v1 AS t1
INNER JOIN v1 AS t2
    USING (id)
INNER JOIN v1 AS t3
    USING (value);