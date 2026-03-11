SELECT count()
FROM remote('127.0.0.{1,2}', currentDatabase(), count);

SELECT count() / 2
FROM remote('127.0.0.{1,2}', currentDatabase(), count);