SELECT count(*)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active = 1;