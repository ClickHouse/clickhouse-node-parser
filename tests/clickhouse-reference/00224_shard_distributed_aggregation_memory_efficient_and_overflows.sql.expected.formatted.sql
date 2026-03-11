SELECT count() = 200000
FROM remote('127.0.0.{2,3}', currentDatabase(), numbers_100k_log)
GROUP BY number
WITH TOTALS
ORDER BY number ASC
LIMIT 10;