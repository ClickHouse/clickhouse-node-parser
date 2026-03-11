SELECT *
FROM wrong_metadata
ORDER BY column1 ASC;

SELECT *
FROM wrong_metadata
ORDER BY column1_renamed ASC
FORMAT JSONEachRow;

SELECT *
FROM wrong_metadata_wide
ORDER BY column1 ASC;

SELECT *
FROM wrong_metadata_wide
ORDER BY column1_renamed ASC
FORMAT JSONEachRow;