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
    ) AS x (a); -- { serverError BAD_ARGUMENTS }

SELECT c
FROM (
        SELECT
            number,
            number * 2
        FROM numbers(2)
    ) AS x (a, b); -- { serverError UNKNOWN_IDENTIFIER }

SELECT a
FROM test_view_03280;

SELECT b
FROM test_view_03280;

SELECT c
FROM test_view_03280; -- { serverError UNKNOWN_IDENTIFIER }