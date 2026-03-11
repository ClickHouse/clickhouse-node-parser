SELECT *
FROM loop(remote('localhost:9000', currentDatabase(), 't0')) AS tx;

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