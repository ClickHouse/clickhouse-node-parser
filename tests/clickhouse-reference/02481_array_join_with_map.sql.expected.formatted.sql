SELECT
    s,
    arr1,
    map1
FROM
    arrays_test
ARRAY JOIN arr1, map1
SETTINGS enable_unaligned_array_join = 1;

SELECT
    s,
    arr1,
    map1
FROM
    arrays_test
LEFT ARRAY JOIN arr1, map1
SETTINGS enable_unaligned_array_join = 1;

SELECT
    s,
    map1
FROM
    arrays_test
ARRAY JOIN map1;

SELECT
    s,
    map1
FROM
    arrays_test
LEFT ARRAY JOIN map1;

SELECT
    s,
    map1,
    map2
FROM
    arrays_test
ARRAY JOIN map1, map2
SETTINGS enable_unaligned_array_join = 1;

SELECT
    s,
    map1,
    map2
FROM
    arrays_test
LEFT ARRAY JOIN map1, map2
SETTINGS enable_unaligned_array_join = 1;