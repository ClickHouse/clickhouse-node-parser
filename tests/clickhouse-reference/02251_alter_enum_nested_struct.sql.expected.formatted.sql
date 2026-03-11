SELECT *
FROM alter_enum_array
ORDER BY Key ASC;

SELECT COUNT()
FROM `system`.mutations
WHERE table = 'alter_enum_array'
    AND database = currentDatabase()
    AND NOT is_done;