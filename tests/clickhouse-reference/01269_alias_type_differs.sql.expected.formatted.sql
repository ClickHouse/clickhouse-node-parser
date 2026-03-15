CREATE TABLE data_01269
(
    key Int32,
    value Nullable(Int32),
    alias UInt8 ALIAS value > 0
)
ENGINE = MergeTree()
ORDER BY key;

-- after PR#10441
SELECT toTypeName(alias)
FROM data_01269;

SELECT any(alias)
FROM data_01269;