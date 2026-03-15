CREATE TABLE defaults_on_defaults (
    key UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();
SELECT 1 from defaults_on_defaults where length(`Arr.C2`) = 0;
SELECT 1 from defaults_on_defaults where length(`Arr.C3`) = 0;
SELECT 1 from defaults_on_defaults where length(`Arr.C4`) = 0;
SELECT 1 from defaults_on_defaults where ArrLen = 0;
SELECT * from defaults_on_defaults where ArrLen = 0;
