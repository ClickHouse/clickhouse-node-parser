SELECT a1 
FROM
(
    SELECT x AS a1, x AS a2 FROM test_00681
    UNION ALL
    SELECT x, x FROM test_00681
);
