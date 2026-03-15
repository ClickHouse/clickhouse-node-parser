-- Tags: no-parallel
-- https://github.com/ClickHouse/ClickHouse/issues/11469
SELECT dictGet('default.countryId', 'country', toUInt64(number)) AS country
FROM numbers(2)
GROUP BY country; -- { serverError BAD_ARGUMENTS }

CREATE DATABASE dictdb_01376;

CREATE TABLE dictdb_01376.table_for_dict
(
    key_column UInt64,
    value Float64
)
ENGINE = Memory();

CREATE DICTIONARY IF NOT EXISTS dictdb_01376.dict_exists
(
    key_column UInt64,
    value Float64 DEFAULT 77.77
)
PRIMARY KEY key_column
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'table_for_dict' DB 'dictdb_01376'))
LIFETIME(1)
LAYOUT(FLAT());

SELECT dictGet('dictdb_01376.dict_exists', 'value', toUInt64(1)) AS val
FROM numbers(2)
GROUP BY val;