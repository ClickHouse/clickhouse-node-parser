CREATE TABLE dict_data
(
    key UInt64,
    v0 UInt16,
    v1 UInt16,
    v2 UInt16,
    v3 UInt16,
    v4 UInt16
)
ENGINE = Memory() AS
SELECT
    number,
    number % 65535,
    number % 65535,
    number % 6553,
    number % 655355,
    number % 65535
FROM numbers(1e6);

CREATE DICTIONARY dict_sharded
(
    key UInt64,
    v0 UInt16
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE 'dict_data'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED(SHARDS 32));

SELECT
    name,
    length(attribute.names),
    element_count,
    round(load_factor, 4)
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'dict_sharded';

CREATE DICTIONARY dict_sharded_multi
(
    key UInt64,
    v0 UInt16,
    v1 UInt16,
    v2 UInt16,
    v3 UInt16,
    v4 UInt16
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE 'dict_data'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED(SHARDS 32));

SELECT
    name,
    length(attribute.names),
    element_count,
    round(load_factor, 4)
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'dict_sharded_multi';