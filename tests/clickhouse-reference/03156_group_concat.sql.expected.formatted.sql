SELECT *
FROM test_groupConcat;

SELECT groupConcat(p_int)
FROM test_groupConcat;

SELECT groupConcat(p_string)
FROM test_groupConcat;

SELECT groupConcat(p_array)
FROM test_groupConcat;

SELECT groupConcat('', 1)(p_array)
FROM test_groupConcat;

SELECT groupConcat('', 3)(p_string)
FROM test_groupConcat;

SELECT groupConcat('', 2)(p_int)
FROM test_groupConcat;

SELECT groupConcat('\n', 3)(p_int)
FROM test_groupConcat;

SELECT groupConcat(',')(p_int)
FROM test_groupConcat;

SELECT groupConcat(',')(p_string)
FROM test_groupConcat;

SELECT groupConcat(',', 2)(p_array)
FROM test_groupConcat;

SELECT groupConcat(p_int)
FROM test_groupConcat
WHERE id = 1;

SELECT groupConcat(123)(number)
FROM numbers(10);

SELECT groupConcat(',', '3')(number)
FROM numbers(10);

SELECT groupConcat(',', 0)(number)
FROM numbers(10);

SELECT groupConcat(',', -1)(number)
FROM numbers(10);

SELECT groupConcat(',', 3, 3)(number)
FROM numbers(10);

SELECT length(groupConcat(number))
FROM numbers(100000);

SELECT groupConcat(p_int, ',')
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT groupConcat('.')(p_string)
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT groupConcat(p_array, '/')
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT group_concat(p_array, '/')
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT grouP_CONcat(',')(p_array, '/')
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT grouP_CONcat(',', 2)(p_array, '/')
FROM test_groupConcat
SETTINGS enable_analyzer = 1;

SELECT length(groupConcat(p_int))
FROM test_groupConcat;