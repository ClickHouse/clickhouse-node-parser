SELECT 1
    AND greatest(number % 2, number % 3)
FROM numbers(10);

SELECT 1
    AND least(number % 2, number % 3)
FROM numbers(10);