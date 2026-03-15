CREATE TABLE distinct (Num UInt32, Name String) ENGINE = Memory;
-- { echoOn }
-- String field
SELECT Name FROM (SELECT DISTINCT Name FROM distinct) ORDER BY Name;
-- Num field
SELECT Num FROM (SELECT DISTINCT Num FROM distinct) ORDER BY Num;
-- all const columns
SELECT DISTINCT 1 as a, 2 as b FROM distinct;
