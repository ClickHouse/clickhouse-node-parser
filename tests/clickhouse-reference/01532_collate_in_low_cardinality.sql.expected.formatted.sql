SELECT *
FROM test_collate
ORDER BY s ASC;

SELECT *
FROM test_collate
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM test_collate
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM test_collate
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM test_collate_null
ORDER BY s ASC;

SELECT *
FROM test_collate_null
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM test_collate_null
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM test_collate_null
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';