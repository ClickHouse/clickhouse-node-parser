SELECT * FROM x ORDER BY number;
SELECT * FROM remote('127.0.0.{1,2}', currentDatabase(), y) ORDER BY number;
