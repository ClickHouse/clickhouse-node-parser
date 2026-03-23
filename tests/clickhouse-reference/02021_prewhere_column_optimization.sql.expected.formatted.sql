SYSTEM drop  table if exists data_02021;

CREATE TABLE data_02021
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data_02021;

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

-- { echoOff }
SYSTEM drop  table data_02021;