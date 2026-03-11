SELECT *
FROM test
WHERE x == 1
    AND arrayExists((x1, x2) -> (x1 == x2), arr1, arr2)
SETTINGS allow_reorder_prewhere_conditions = 0;