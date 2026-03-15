-- { echo }
CREATE FUNCTION 02483_plusone AS (a) -> a + 1;
CREATE TABLE 02483_substitute_udf (id UInt32, number UInt32 DEFAULT 02483_plusone(id)) ENGINE=MergeTree() ORDER BY id;
SELECT * FROM 02483_substitute_udf ORDER BY id;
CREATE FUNCTION 02483_plustwo AS (a) -> a + 2;
CREATE FUNCTION 02483_plusthree AS (a) -> a + 3;
