SELECT a
FROM lower_test
WHERE lower(b) IN ('a', 'b')
ORDER BY a ASC;