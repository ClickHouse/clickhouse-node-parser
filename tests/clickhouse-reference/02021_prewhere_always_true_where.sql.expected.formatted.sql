CREATE TABLE data_02021
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data_02021;

SELECT count()
FROM data_02021
PREWHERE 1
    OR ignore(key)
WHERE ignore(key) = 0;