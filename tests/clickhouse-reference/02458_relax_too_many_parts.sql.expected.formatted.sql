SELECT
    count(),
    round(avg(bytes), -6)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
    AND active;