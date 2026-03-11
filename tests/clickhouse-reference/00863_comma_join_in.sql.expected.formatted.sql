SELECT test2_00863.id
FROM
    test1_00863
CROSS JOIN test2_00863
CROSS JOIN test3_00863
WHERE test1_00863.code IN ('1', '2', '3')
    AND test2_00863.test1_id = test1_00863.id
    AND test2_00863.test3_id = test3_00863.id
ORDER BY `all` ASC;