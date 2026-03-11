SELECT
    table,
    name,
    comment
FROM `system`.`columns`
WHERE table = 'test_alter_drop_comment'
    AND database = currentDatabase()
ORDER BY name ASC;