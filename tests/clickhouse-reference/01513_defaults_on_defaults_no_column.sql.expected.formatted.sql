DROP TABLE IF EXISTS defaults_on_defaults;

CREATE TABLE defaults_on_defaults
(
    key UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO defaults_on_defaults;

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C2`) = 0;

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C3`) = 0;

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C4`) = 0;

SELECT 1
FROM defaults_on_defaults
WHERE ArrLen = 0;

SELECT *
FROM defaults_on_defaults
WHERE ArrLen = 0;