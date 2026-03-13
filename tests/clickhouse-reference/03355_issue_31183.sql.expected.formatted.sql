SELECT
    t1.col,
    t1.col_sq
FROM
    test2 AS t2
LEFT JOIN test1 AS t1
    ON t1.col = t2.col
SETTINGS enable_analyzer = 1;

SELECT
    t1.col,
    t1.col_sq
FROM
    test2 AS t2
LEFT JOIN test1 AS t1
    ON t1.col = t2.col
SETTINGS enable_analyzer = 0; -- {serverError UNKNOWN_IDENTIFIER}