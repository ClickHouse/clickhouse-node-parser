SELECT marks
FROM `system`.parts
WHERE table = 'adaptive_table'
    AND database = currentDatabase()
    AND active;

SELECT max(length(value))
FROM adaptive_table;