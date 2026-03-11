SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON 1 = 1;

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON 1;

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON 2 = 2
    AND 3 = 3;

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON toNullable(1);

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON toLowCardinality(1);

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON toLowCardinality(toNullable(1));

SELECT 70 = 10 * sum(t1.id) + sum(t2.id)
    AND count() == 4
FROM
    t1
INNER JOIN t2
    ON toNullable(toLowCardinality(1));

SELECT *
FROM
    t1
INNER JOIN t2
    ON toUInt16(1);

SELECT *
FROM
    t1
INNER JOIN t2
    ON toInt8(1);

SELECT *
FROM
    t1
INNER JOIN t2
    ON 256;

SELECT *
FROM
    t1
INNER JOIN t2
    ON -1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON toString(1);

SELECT *
FROM
    t1
INNER JOIN t2
    ON NULL;

SELECT *
FROM
    t1
INNER JOIN t2
    ON 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON 1 = 2;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC;

SELECT *
FROM
    t1
RIGHT JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC;

SELECT *
FROM
    t1
FULL JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t1
RIGHT JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t1
FULL JOIN t2
    ON NULL
ORDER BY
    t1.id ASC,
    t2.id ASC
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON 1 = 1
SETTINGS join_algorithm = 'full_sorting_merge';

SELECT *
FROM
    t1
INNER JOIN t2
    ON 1 = 1
SETTINGS join_algorithm = 'partial_merge';

SELECT *
FROM
    t1
INNER JOIN t2
    ON 1 = 1
SETTINGS join_algorithm = 'auto';

SELECT *
FROM
    t1
INNER JOIN t2
    ON NULL
SETTINGS join_algorithm = 'full_sorting_merge';

SELECT *
FROM
    t1
INNER JOIN t2
    ON NULL
SETTINGS join_algorithm = 'partial_merge';

SELECT *
FROM
    t1
LEFT JOIN t2
    ON NULL
SETTINGS join_algorithm = 'partial_merge';

SELECT *
FROM
    t1
RIGHT JOIN t2
    ON NULL
SETTINGS join_algorithm = 'auto';

SELECT *
FROM
    t1
FULL JOIN t2
    ON NULL
SETTINGS join_algorithm = 'partial_merge';

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 == 1
SETTINGS enable_analyzer = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 == 1
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 == 2
SETTINGS enable_analyzer = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 == 2
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 != 1
SETTINGS enable_analyzer = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1 != 1
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 'aaa';

SELECT *
FROM
    t1
INNER JOIN t2
    ON 'aaa';

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 0
SETTINGS enable_analyzer = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 0
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1
SETTINGS enable_analyzer = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND 1
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.id = t2.id
    AND 1 = 1
ORDER BY 1 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
RIGHT JOIN t2
    ON t1.id = t2.id
    AND 1 = 1
ORDER BY 1 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
FULL JOIN t2
    ON t1.id = t2.id
    AND 1 = 1
ORDER BY
    2 ASC,
    1 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
LEFT JOIN t2
    ON t1.id = t2.id
    AND 1 = 2
ORDER BY 1 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
RIGHT JOIN t2
    ON t1.id = t2.id
    AND 1 = 2
ORDER BY 2 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
FULL JOIN t2
    ON t1.id = t2.id
    AND 1 = 2
ORDER BY
    2 ASC,
    1 ASC
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
INNER JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
LEFT JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
RIGHT JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
FULL JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL
ORDER BY 2 ASC;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
INNER JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
INNER JOIN (
        SELECT ('b', 256) AS b
    ) AS t2
    ON NULL
ORDER BY 2 ASC;

SELECT a + 1
FROM
    (
        SELECT 1 AS x
    ) AS t1
LEFT JOIN (
        SELECT 1 AS a
    ) AS t2
    ON true
SETTINGS
    enable_analyzer = 1,
    join_use_nulls = 1;

SELECT
    a + 1,
    x + 1,
    toTypeName(a),
    toTypeName(x)
FROM
    (
        SELECT 1 AS x
    ) AS t1
LEFT JOIN (
        SELECT sum(number) AS a
        FROM numbers(3)
        GROUP BY NULL
    ) AS t2
    ON true
SETTINGS
    enable_analyzer = 1,
    join_use_nulls = 1;

SELECT
    a + 1,
    x + 1,
    toTypeName(a),
    toTypeName(x)
FROM
    (
        SELECT 1 AS x
    ) AS t1
RIGHT JOIN (
        SELECT sum(number) AS a
        FROM numbers(3)
        GROUP BY NULL
    ) AS t2
    ON true
SETTINGS
    enable_analyzer = 1,
    join_use_nulls = 1;

SELECT
    a + 1,
    x + 1,
    toTypeName(a),
    toTypeName(x)
FROM
    (
        SELECT 1 AS x
    ) AS t1
FULL JOIN (
        SELECT sum(number) AS a
        FROM numbers(3)
        GROUP BY NULL
    ) AS t2
    ON true
SETTINGS
    enable_analyzer = 1,
    join_use_nulls = 1;

SELECT *
FROM
    t1
LEFT JOIN empty_table
    ON 1 = 1
ORDER BY `ALL` ASC;

SELECT *
FROM
    t1
FULL JOIN empty_table
    ON 1 = 1
ORDER BY `ALL` ASC;

SELECT *
FROM
    t1
LEFT JOIN empty_table
    ON 1 = 2
ORDER BY `ALL` ASC;

SELECT *
FROM
    t1
FULL JOIN empty_table
    ON 1 = 2
ORDER BY `ALL` ASC;

SELECT *
FROM
    empty_table
RIGHT JOIN t1
    ON 1 = 1
ORDER BY `ALL` ASC;

SELECT *
FROM
    empty_table
FULL JOIN t1
    ON 1 = 1
ORDER BY `ALL` ASC;

SELECT *
FROM
    empty_table
RIGHT JOIN t1
    ON 1 = 2
ORDER BY `ALL` ASC;

SELECT *
FROM
    empty_table
FULL JOIN t1
    ON 1 = 2
ORDER BY `ALL` ASC;

SELECT *
FROM
    t1
INNER JOIN empty_table
    ON 1 = 1;

SELECT *
FROM
    t1
RIGHT JOIN empty_table
    ON 1 = 1;

SELECT *
FROM
    t1
INNER JOIN empty_table
    ON 1 = 2;

SELECT *
FROM
    t1
RIGHT JOIN empty_table
    ON 1 = 2;

SELECT *
FROM
    empty_table
INNER JOIN t1
    ON 1 = 1;

SELECT *
FROM
    empty_table
LEFT JOIN t1
    ON 1 = 1;

SELECT *
FROM
    empty_table
INNER JOIN t1
    ON 1 = 2;

SELECT *
FROM
    empty_table
LEFT JOIN t1
    ON 1 = 2;