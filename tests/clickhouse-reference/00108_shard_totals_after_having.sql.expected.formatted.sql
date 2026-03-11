SELECT
    dummy,
    count()
FROM remote('127.0.0.{2,3}', `system`, one)
GROUP BY dummy
WITH TOTALS;