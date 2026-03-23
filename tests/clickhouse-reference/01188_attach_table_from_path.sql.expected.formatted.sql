-- Tags: no-replicated-database, memory-engine
DROP TABLE IF EXISTS test;

DROP TABLE IF EXISTS file;

DROP TABLE IF EXISTS mt;

INSERT INTO FUNCTION file('01188_attach/file/data.TSV', 'TSV', 's String, n UInt8');

SELECT *
FROM file;

SELECT *
FROM mt;

INSERT INTO mt;

DROP TABLE file;

DROP TABLE mt;