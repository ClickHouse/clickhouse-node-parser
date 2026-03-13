-- https://github.com/ClickHouse/ClickHouse/issues/59596
SELECT cosineDistance((1, 1), (toNullable(0.5), 0.1));

SELECT cosineDistance((1, 1), (toNullable(0.5), 0.1))
FROM numbers(10);