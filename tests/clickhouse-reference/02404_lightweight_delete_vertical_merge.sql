SELECT * FROM lwd_test ORDER BY id, value;
SELECT name, part_type
FROM system.parts
WHERE (database = currentDatabase()) AND (table = 'lwd_test') AND active
ORDER BY name;
SELECT name, column, type, rows
FROM system.parts_columns
WHERE (database = currentDatabase()) AND (table = 'lwd_test') AND active
ORDER BY name, column;
