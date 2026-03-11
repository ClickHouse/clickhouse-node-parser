SELECT b
FROM t1;

SELECT b
FROM
    t1
INNER JOIN t2
    USING (b);

SELECT 1 AS b
FROM
    t1
INNER JOIN t2
    USING (b);

SELECT 1 AS b
FROM
    t1
INNER JOIN t2
    USING (b)
SETTINGS analyzer_compatibility_join_using_top_level_identifier = 1;

SELECT 2 AS a
FROM
    t1
INNER JOIN t2
    USING (a)
SETTINGS analyzer_compatibility_join_using_top_level_identifier = 1;