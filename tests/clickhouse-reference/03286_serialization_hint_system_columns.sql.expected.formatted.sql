SELECT
    name,
    serialization_hint
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 't_serialization_hints'
ORDER BY name ASC;