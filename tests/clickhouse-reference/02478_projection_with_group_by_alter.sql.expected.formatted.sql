SELECT c
FROM testing
ORDER BY d ASC;

SELECT c
FROM testing
ORDER BY
    e ASC,
    d ASC;

SELECT *
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'testing'
    AND NOT is_done;