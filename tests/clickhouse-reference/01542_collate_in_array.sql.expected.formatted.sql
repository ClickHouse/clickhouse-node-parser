SELECT *
FROM collate_test1
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test1
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test2
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test2
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test3
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test3
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';