SELECT
    min(b),
    x AS b
FROM (
        SELECT max(number)
        FROM numbers(1)
    );