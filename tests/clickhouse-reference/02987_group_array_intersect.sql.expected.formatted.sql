SELECT arraySort(groupArrayIntersect(*))
FROM test_empty;

SELECT arraySort(groupArrayIntersect(*))
FROM test_null;

SELECT arraySort(groupArrayIntersect(*))
FROM test_nested_arrays;

SELECT arraySort(groupArrayIntersect(*))
FROM test_numbers;

SELECT arraySort(groupArrayIntersect(*))
FROM test_big_numbers_sep;

SELECT length(groupArrayIntersect(*))
FROM test_big_numbers;

SELECT arraySort(groupArrayIntersect(*))
FROM test_big_numbers;

SELECT arraySort(groupArrayIntersect(*))
FROM test_string;

SELECT length(groupArrayIntersect(*))
FROM test_big_string;

SELECT arraySort(groupArrayIntersect(*))
FROM test_big_string;

SELECT arraySort(groupArrayIntersect(*))
FROM test_datetime;

SELECT arraySort(groupArrayIntersect(*))
FROM test_date32;

SELECT arraySort(groupArrayIntersect(*))
FROM test_date;