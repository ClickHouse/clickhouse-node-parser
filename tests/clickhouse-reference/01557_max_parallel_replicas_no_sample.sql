SELECT * FROM remote('127.0.0.{2|3|4}', currentDatabase(), t);
SELECT count() FROM remote('127.0.0.{2|3|4}', currentDatabase(), t);
