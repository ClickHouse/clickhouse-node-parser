CREATE TABLE IF NOT EXISTS badFixedStringSort
(
    uuid5_old FixedString(16),
    subitem String
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    hex(uuid5_old),
    subitem
FROM badFixedStringSort
ORDER BY
    uuid5_old ASC,
    subitem ASC;