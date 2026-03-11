SELECT x
FROM
    t
FULL JOIN r
    USING (x)
ORDER BY `ALL` ASC;

SELECT x
FROM
    t
FULL JOIN r
    USING (x)
ORDER BY `ALL` ASC
SETTINGS join_algorithm = 'partial_merge';

SELECT x
FROM
    t
FULL JOIN r
    USING (x)
ORDER BY `ALL` ASC
SETTINGS join_algorithm = 'full_sorting_merge';

SELECT '--- analyzer ---';