SELECT
    s,
    lc
FROM mv
WHERE NOT ignore(lc)
SETTINGS enable_analyzer = 0;

SELECT
    s,
    lc
FROM mv
WHERE NOT ignore(lc)
SETTINGS enable_analyzer = 1;