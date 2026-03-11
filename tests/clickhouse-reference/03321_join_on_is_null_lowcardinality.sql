SELECT * FROM test
FULL JOIN test2
ON test.value IS NULL AND test2.value IS NULL OR test.value == test2.value
SETTINGS join_use_nulls = 1
;
SELECT * FROM test
FULL JOIN test2
ON test.value == test2.value
ORDER BY ALL
SETTINGS join_use_nulls = 1
;
