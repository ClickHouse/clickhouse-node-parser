SELECT countIf(*, number < 5)
FROM numbers(10);

SELECT countIf(*, number < 20)
FROM (
        SELECT
            number,
            1,
            2
        FROM numbers(100)
    );

SELECT countIf(number < 20)
FROM (
        SELECT
            number,
            1,
            2
        FROM numbers(100)
    );