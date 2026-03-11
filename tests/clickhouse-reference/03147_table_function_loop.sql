-- Tags: no-parallel

SELECT * FROM loop(numbers(3)) LIMIT 10;
SELECT * FROM loop (numbers(3)) LIMIT 10 settings max_block_size = 1;
SELECT * FROM loop(t) LIMIT 15; -- { serverError TOO_MANY_RETRIES_TO_FETCH_PARTS }
SELECT * FROM loop({CLICKHOUSE_DATABASE:Identifier}.t) LIMIT 15;
SELECT * FROM loop({CLICKHOUSE_DATABASE:Identifier}, t) LIMIT 15;
SELECT * FROM loop('', '') -- { serverError UNKNOWN_TABLE }
