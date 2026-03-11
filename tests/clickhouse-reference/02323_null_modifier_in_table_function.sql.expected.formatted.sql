SELECT *
FROM values('x UInt8 NOT NULL', 1);

SELECT *
FROM values('x UInt8 NULL', NULL);

SELECT *
FROM file(concat(currentDatabase(), '_data_02323.tsv'), auto, 'x UInt32 NOT NULL');

SELECT *
FROM file(concat(currentDatabase(), '_data_02323.tsv'), auto, 'x UInt32 NULL');

SELECT *
FROM generateRandom('x UInt64 NULL', 7, 3)
LIMIT 2;