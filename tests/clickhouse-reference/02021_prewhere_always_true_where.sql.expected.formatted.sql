CREATE TABLE data_02021
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

SELECT count()
FROM data_02021
PREWHERE 1
    OR ignore(key)
WHERE ignore(key) = 0;