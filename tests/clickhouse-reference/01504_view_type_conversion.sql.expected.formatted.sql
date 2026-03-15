CREATE VIEW testv (a UInt32)
AS
SELECT number AS a
FROM numbers(10);

SELECT groupArray(a)
FROM testv;

CREATE VIEW testv (a String)
AS
SELECT number AS a
FROM numbers(10);