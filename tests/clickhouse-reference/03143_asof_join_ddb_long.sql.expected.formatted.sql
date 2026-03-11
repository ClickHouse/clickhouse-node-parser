SELECT
    SUM(value),
    COUNT(*)
FROM
    skewed_probe
INNER JOIN build
    USING (key, begin);

SELECT
    SUM(value),
    COUNT(*)
FROM
    skewed_probe
INNER JOIN build
    USING (key, begin)
SETTINGS join_algorithm = 'full_sorting_merge';