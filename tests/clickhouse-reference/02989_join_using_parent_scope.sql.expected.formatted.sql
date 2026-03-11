SELECT 1 AS c0
FROM
    (
        SELECT 1 AS c1
    ) AS t0
INNER JOIN (
        SELECT 1 AS c0
    ) AS t1
    USING (c0);

SELECT 1 AS c0
FROM
    (
        SELECT 1 AS c0
    ) AS t0
INNER JOIN (
        SELECT 1 AS c0
    ) AS t1
    USING (c0);

SELECT 1 AS a
FROM
    tb
INNER JOIN tabc
    USING (a)
ORDER BY `ALL` ASC;

SELECT a + 2 AS b
FROM
    ta
INNER JOIN tabc
    USING (b)
ORDER BY `ALL` ASC;

SELECT b + 2 AS a
FROM
    tb
INNER JOIN tabc
    USING (a)
ORDER BY `ALL` ASC;

SELECT a + 2 AS c
FROM
    ta
INNER JOIN tabc
    USING (c)
ORDER BY `ALL` ASC;

SELECT
    b AS a,
    a
FROM
    tb
INNER JOIN tabc
    USING (a)
ORDER BY `ALL` ASC;

SELECT 1 AS b
FROM
    tb
INNER JOIN ta
    USING (b);

SELECT
    3 AS a,
    a,
    *
FROM
    tb
FULL JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    tb
INNER JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    tb
LEFT JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    tb
RIGHT JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    tb
FULL JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    tb
FULL JOIN tabc
    USING (a)
ORDER BY `ALL` ASC
SETTINGS
    asterisk_include_alias_columns = 1,
    enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    (
        SELECT b
        FROM tb
    ) AS t1
INNER JOIN (
        SELECT
            a,
            b
        FROM tabc
    ) AS t2
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    (
        SELECT b
        FROM tb
    ) AS t1
LEFT JOIN (
        SELECT
            a,
            b
        FROM tabc
    ) AS t2
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    (
        SELECT b
        FROM tb
    ) AS t1
RIGHT JOIN (
        SELECT
            a,
            b
        FROM tabc
    ) AS t2
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    *
FROM
    (
        SELECT b
        FROM tb
    ) AS t1
FULL JOIN (
        SELECT
            a,
            b
        FROM tabc
    ) AS t2
    USING (a)
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT
    b + 1 AS a,
    s
FROM
    tb
FULL JOIN tabc
    USING (a)
PREWHERE a > 2
ORDER BY `ALL` ASC
SETTINGS enable_analyzer = 1;

SELECT a + 2 AS b
FROM
    tb
INNER JOIN tabc
    USING (b)
ORDER BY `ALL` ASC
SETTINGS analyzer_compatibility_join_using_top_level_identifier = 1;

SELECT a + 2 AS b
FROM
    tb
INNER JOIN tabc
    USING (b)
ORDER BY `ALL` ASC
SETTINGS
    analyzer_compatibility_join_using_top_level_identifier = 0,
    enable_analyzer = 1;

SELECT
    u1.uid,
    u1.spouse_name AS name,
    u2.uid,
    u2.name
FROM
    users AS u1
INNER JOIN users AS u2
    USING (name)
ORDER BY u1.uid ASC
FORMAT TSVWithNamesAndTypes
SETTINGS enable_analyzer = 1, analyzer_compatibility_join_using_top_level_identifier = 1;

SELECT
    u1.uid,
    u1.spouse_name AS name,
    u2.uid,
    u2.name
FROM
    users AS u1
INNER JOIN users AS u2
    USING (name)
ORDER BY u1.uid ASC
FORMAT TSVWithNamesAndTypes
SETTINGS enable_analyzer = 1, analyzer_compatibility_join_using_top_level_identifier = 0;

SELECT
    u1.uid,
    u1.spouse_name AS name,
    u2.uid,
    u2.name
FROM
    users AS u1
INNER JOIN users AS u2
    USING (name)
ORDER BY u1.uid ASC
FORMAT TSVWithNamesAndTypes
SETTINGS enable_analyzer = 0;