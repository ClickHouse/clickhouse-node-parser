SELECT or(less(2, 2 + 1), greater(2, 4 - 1));

SELECT number
FROM (
        SELECT number
        FROM `system`.numbers
        LIMIT 10
    )
WHERE or(less(number, 2), greater(number, 4));

SELECT
    and(greaterOrEquals(number, 4), lessOrEquals(number, 6)),
    NOT or(less(number, 4), greater(number, 6))
    AND 1
FROM numbers(10);