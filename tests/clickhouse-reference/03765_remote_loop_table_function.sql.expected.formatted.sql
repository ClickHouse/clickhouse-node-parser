SELECT 1
FROM remote('localhost', loop(currentDatabase(), 't0_03765')) AS tx;

SELECT 1
FROM remote('127.0.0.1', loop(currentDatabase(), 't0_03765'))
LIMIT 3;

SELECT *
FROM remote('127.0.0.1', loop(currentDatabase(), 't0_03765'))
LIMIT 5;