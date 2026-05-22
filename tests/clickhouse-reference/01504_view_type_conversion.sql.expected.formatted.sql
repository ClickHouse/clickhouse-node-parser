DROP TABLE IF EXISTS testv;

CREATE VIEW testv (a UInt32)
AS
SELECT number AS a
FROM numbers(10);

SELECT groupArray(a)
FROM testv;

DROP TABLE testv;

CREATE VIEW testv (a String)
AS
SELECT number AS a
FROM numbers(10);