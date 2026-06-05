EXPLAIN SYNTAX
SELECT multiIf(number = 0, NULL, toNullable(number))
FROM numbers(10000);

EXPLAIN SYNTAX
SELECT multiIf(number = 0, NULL, toNullable(number))
FROM numbers(10000);