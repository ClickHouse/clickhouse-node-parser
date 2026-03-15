CREATE TABLE numbers_squashed (number UInt8) ENGINE = StripeLog;
SET min_insert_block_size_rows = 100;
SET min_insert_block_size_bytes = 0;
SET max_insert_threads = 1;
SET max_threads = 1;
SELECT blockSize() AS b, count() / b AS c FROM numbers_squashed GROUP BY blockSize() ORDER BY c DESC, b ASC;
SELECT count() FROM numbers_squashed;
SET min_insert_block_size_rows = 10;
