SELECT '--- notEmpty';

SELECT *
FROM count_lc_test
WHERE notEmpty(arr);

SELECT *
FROM count_lc_test
WHERE empty(arr);

SELECT *
FROM count_lc_test
WHERE arr = [];

SELECT *
FROM count_lc_test
WHERE arr != [];

SELECT *
FROM count_lc_test
WHERE arr > [];

SELECT *
FROM count_lc_test
WHERE arr < [];

SELECT *
FROM count_lc_test
WHERE arr >= [];

SELECT *
FROM count_lc_test
WHERE arr <= [];