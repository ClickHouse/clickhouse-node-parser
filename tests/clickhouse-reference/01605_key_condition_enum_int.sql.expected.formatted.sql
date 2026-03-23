DROP TABLE IF EXISTS enum;

CREATE TABLE enum
ENGINE = MergeTree
ORDER BY enum AS
SELECT cast(1, 'Enum8(''zero''=0, ''one''=1)') AS enum;

SELECT *
FROM enum
WHERE enum = 1;