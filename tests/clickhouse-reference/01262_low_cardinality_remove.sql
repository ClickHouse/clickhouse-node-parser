CREATE TABLE IF NOT EXISTS testTable (
 A LowCardinality(String), -- like voter
 B Int64
) ENGINE MergeTree()
ORDER BY (A);
CREATE VIEW testView AS 
SELECT
 A as ALow, -- like account
 B
FROM
   testTable;
SELECT CAST(ALow, 'String') AS AStr
FROM testView
GROUP BY AStr ORDER BY AStr;
CREATE TABLE IF NOT EXISTS testTable (
 A String, -- like voter
 B Int64
) ENGINE MergeTree()
ORDER BY (A);
