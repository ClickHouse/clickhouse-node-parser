SELECT DISTINCT (blockSize() <= 4214)
FROM (
        SELECT number
        FROM numbers(100000)
        GROUP BY number
    );