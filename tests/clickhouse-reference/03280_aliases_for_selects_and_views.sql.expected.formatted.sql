SELECT b
FROM (
        SELECT
            number,
            number * 2
        FROM numbers(2)
    ) AS x (a, b);

SELECT a
FROM (
        SELECT
            number,
            number * 2
        FROM numbers(2)
    ) AS x (a, b);

SELECT a
FROM (
        SELECT
            number,
            number * 2
        FROM numbers(2)
    ) AS x (a);

SELECT c
FROM (
        SELECT
            number,
            number * 2
        FROM numbers(2)
    ) AS x (a, b);

SELECT a
FROM test_view_03280;

SELECT b
FROM test_view_03280;

SELECT c
FROM test_view_03280;