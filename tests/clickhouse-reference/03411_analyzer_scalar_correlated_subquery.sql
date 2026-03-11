SELECT *
FROM numbers(2)
WHERE (SELECT count() FROM system.one WHERE number = 2) is NULL
ORDER BY all;
