-- Tags: no-replicated-database, memory-engine
SYSTEM drop  table if exists test;

SYSTEM drop  table if exists file;

SYSTEM drop  table if exists mt;

INSERT INTO FUNCTION file('01188_attach/file/data.TSV', 'TSV', 's String, n UInt8');

SELECT *
FROM file;

SELECT *
FROM mt;

INSERT INTO mt;

SYSTEM drop  table file;

SYSTEM drop  table mt;