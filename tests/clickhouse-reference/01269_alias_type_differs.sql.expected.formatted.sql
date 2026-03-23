DROP TABLE IF EXISTS data_01269;

CREATE TABLE data_01269
(
    key Int32,
    value Nullable(Int32),
    alias UInt8 ALIAS value > 0
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data_01269;

-- after PR#10441
SELECT toTypeName(alias)
FROM data_01269;

SELECT any(alias)
FROM data_01269;

DROP TABLE data_01269;