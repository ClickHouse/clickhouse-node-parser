SELECT toInt64(`partition`) AS p
FROM `system`.parts
WHERE table = 'table1'
    AND database = currentDatabase()
ORDER BY p ASC;

SELECT id
FROM table1
WHERE id % 200 = 2
    OR id % 200 = -2
ORDER BY id ASC;

SELECT id
FROM table1
WHERE id % 200 > 0
ORDER BY id ASC;

SELECT id
FROM table1
WHERE id % 200 < 0
ORDER BY id ASC;

SELECT `partition` AS p
FROM `system`.parts
WHERE table = 'table2'
    AND database = currentDatabase()
ORDER BY p ASC;

SELECT `partition` AS p
FROM `system`.parts
WHERE table = 'table3'
    AND database = currentDatabase()
ORDER BY p ASC;

SELECT count()
FROM table4
WHERE id % 10 = 7;

SELECT
    v,
    v - 205 AS vv,
    modulo(vv, 200),
    moduloLegacy(vv, 200)
FROM table1
ORDER BY v ASC;