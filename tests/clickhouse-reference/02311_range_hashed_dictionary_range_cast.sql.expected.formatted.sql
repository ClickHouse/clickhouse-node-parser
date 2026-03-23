CREATE TABLE dictionary_source_table
(
    key UInt64,
    start UInt64,
    `end` UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO dictionary_source_table;

CREATE DICTIONARY range_hashed_dictionary
(
    key UInt64,
    start UInt64,
    `end` UInt64,
    value String
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE 'dictionary_source_table'))
LIFETIME(0)
RANGE(MIN start MAX `end`)
LAYOUT(RANGE_HASHED());

SELECT dictGet('range_hashed_dictionary', 'value', toUInt64(1), toUInt64(18446744073709551615));

SELECT dictGet('range_hashed_dictionary', 'value', toUInt64(1), toUInt64(-1));