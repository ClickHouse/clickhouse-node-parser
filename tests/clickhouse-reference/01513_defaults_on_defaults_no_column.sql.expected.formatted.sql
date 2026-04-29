DROP TABLE IF EXISTS defaults_on_defaults;

CREATE TABLE defaults_on_defaults
(
    key UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO defaults_on_defaults;

ALTER TABLE defaults_on_defaults ADD COLUMN `Arr.C1` Array(UInt32) DEFAULT emptyArrayUInt32();

ALTER TABLE defaults_on_defaults ADD COLUMN `Arr.C2` Array(UInt32) DEFAULT arrayResize(emptyArrayUInt32(), length(`Arr.C1`));

ALTER TABLE defaults_on_defaults ADD COLUMN `Arr.C3` Array(UInt32) ALIAS arrayResize(emptyArrayUInt32(), length(`Arr.C2`));

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C2`) = 0;

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C3`) = 0;

ALTER TABLE defaults_on_defaults ADD COLUMN `Arr.C4` Array(UInt32) DEFAULT arrayResize(emptyArrayUInt32(), length(`Arr.C3`));

SELECT 1
FROM defaults_on_defaults
WHERE length(`Arr.C4`) = 0;

ALTER TABLE defaults_on_defaults ADD COLUMN ArrLen UInt64 DEFAULT length(`Arr.C4`);

SELECT 1
FROM defaults_on_defaults
WHERE ArrLen = 0;

SELECT *
FROM defaults_on_defaults
WHERE ArrLen = 0;

SHOW CREATE TABLE defaults_on_defaults;

OPTIMIZE TABLE defaults_on_defaults FINAL;