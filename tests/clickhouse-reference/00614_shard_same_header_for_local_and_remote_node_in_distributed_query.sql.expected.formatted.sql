SELECT time
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
WHERE date = '2018-01-21'
LIMIT 2;