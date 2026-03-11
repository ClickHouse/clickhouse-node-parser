SELECT generateRandomStructure(5, 42);

SELECT toTypeName(generateRandomStructure(5, 42));

SELECT toColumnTypeName(generateRandomStructure(5, 42));

SELECT *
FROM generateRandom(generateRandomStructure(5, 42), 42)
LIMIT 1;

SELECT generateRandomStructure(5, 42, 42);

SELECT generateRandomStructure('5');

SELECT generateRandomStructure(5, '42');

SELECT generateRandomStructure(materialize(5), 42);

SELECT generateRandomStructure(5, materialize(42));

SELECT *
FROM generateRandom(10000000)
LIMIT 1;

SELECT *
FROM generateRandom(10000000, 2)
LIMIT 1;

SELECT *
FROM generateRandom(10000000, 2, 2)
LIMIT 1;

SELECT *
FROM generateRandom(10000000, 2, 2, 2)
LIMIT 1;

SELECT generateRandomStructure(5, 4);