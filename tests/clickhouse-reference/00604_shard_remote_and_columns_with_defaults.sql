SELECT * FROM remote('127.0.0.2', currentDatabase(), t1) ORDER BY x;
SELECT * FROM remote('127.0.0.2', currentDatabase(), t2) ORDER BY x;
SELECT * FROM remote('127.0.0.2', currentDatabase(), t3) ORDER BY x;
SELECT x, y FROM remote('127.0.0.2', currentDatabase(), t3) ORDER BY x;
SELECT * FROM remote('127.0.0.2', currentDatabase(), t4) ORDER BY x;
SELECT x, y FROM remote('127.0.0.2', currentDatabase(), t4) ORDER BY x;
