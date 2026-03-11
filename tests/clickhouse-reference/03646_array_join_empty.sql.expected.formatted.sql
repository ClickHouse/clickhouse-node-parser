SELECT
    x,
    arr1,
    arr2
FROM
    t1
ARRAY JOIN COLUMNS('arr.*')
ORDER BY
    arr1 ASC,
    arr2 ASC;

SELECT *
FROM
    t1
ARRAY JOIN COLUMNS('nonexistent');