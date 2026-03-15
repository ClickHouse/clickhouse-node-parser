CREATE TABLE projection_without_key
(
    key UInt32,
    PROJECTION x (    SELECT sum(key)
    GROUP BY key % 3)
)
ENGINE = MergeTree
ORDER BY key;

SELECT sum(key)
FROM projection_without_key
SETTINGS optimize_use_projections = 1;

SELECT sum(key)
FROM projection_without_key
SETTINGS optimize_use_projections = 0;