SELECT name FROM system.parts WHERE table = 'replica2' and database = currentDatabase() and active = 1;
SELECT * FROM replica1;
SELECT * FROM replica2;
SELECT name FROM system.parts WHERE table = 'replica1' and database = currentDatabase() and active = 1 ORDER BY name;
SELECT COUNT() FROM replica1;
