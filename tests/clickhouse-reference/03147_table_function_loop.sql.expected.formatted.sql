SELECT *
FROM loop(numbers(3))
LIMIT 10;

SELECT *
FROM loop(numbers(3))
LIMIT 10
SETTINGS max_block_size = 1;

SELECT *
FROM loop(t)
LIMIT 15;

SELECT *
FROM loop({CLICKHOUSE_DATABASE:Identifier}.t)
LIMIT 15;

SELECT *
FROM loop({CLICKHOUSE_DATABASE: Identifier}, t)
LIMIT 15;

SELECT *
FROM loop('', '');