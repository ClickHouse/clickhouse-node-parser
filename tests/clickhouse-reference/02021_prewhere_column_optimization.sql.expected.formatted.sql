CREATE TABLE data_02021
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

-- { echoOn }
SELECT *
FROM data_02021
PREWHERE 1
    OR ignore(key);

SELECT *
FROM data_02021
PREWHERE 1
    OR ignore(key)
WHERE key = 1;

SELECT *
FROM data_02021
PREWHERE 0
    OR ignore(key);

SELECT *
FROM data_02021
PREWHERE 0
    OR ignore(key)
WHERE key = 1;