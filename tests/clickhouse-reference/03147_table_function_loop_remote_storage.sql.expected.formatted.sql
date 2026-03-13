SELECT *
FROM loop(remote('localhost:9000', currentDatabase(), 't0')) AS tx; -- { serverError TOO_MANY_RETRIES_TO_FETCH_PARTS }

SELECT '---';

SELECT *
FROM loop(remote('localhost:9000', currentDatabase(), 't0')) AS tx
LIMIT 3;

SELECT *
FROM loop(remote('localhost:9000', currentDatabase(), 't0')) AS tx
LIMIT 7;

SELECT *
FROM loop(remote('localhost:9000', currentDatabase(), 't0')) AS tx
LIMIT 11;