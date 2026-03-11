-- Empty table: should get TOO_MANY_RETRIES_TO_FETCH_PARTS (same as loop() alone with empty tables)
SELECT 1 FROM remote('localhost', loop(currentDatabase(), 't0_03765')) tx; -- { serverError TOO_MANY_RETRIES_TO_FETCH_PARTS }
-- With data: selecting a constant should work
SELECT 1 FROM remote('127.0.0.1', loop(currentDatabase(), 't0_03765')) LIMIT 3;
-- With data: selecting actual columns should work
SELECT * FROM remote('127.0.0.1', loop(currentDatabase(), 't0_03765')) LIMIT 5;
