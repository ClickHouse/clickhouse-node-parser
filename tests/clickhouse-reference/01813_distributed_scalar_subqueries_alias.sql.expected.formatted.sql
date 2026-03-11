SELECT a / (
        SELECT sum(number)
        FROM numbers(10)
    )
FROM data_distributed;

SELECT a < (
        SELECT 1
    )
FROM data_distributed;