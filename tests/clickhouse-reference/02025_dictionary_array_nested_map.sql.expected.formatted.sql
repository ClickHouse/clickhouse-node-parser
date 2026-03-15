CREATE TABLE dict_nested_map_test_table
(
    test_id UInt32,
    type String,
    test_config Array(Map(String, Decimal(28, 12))),
    ncp UInt8
)
ENGINE = MergeTree()
ORDER BY test_id;

CREATE DICTIONARY dict_nested_map_dictionary
(
    test_id UInt32,
    type String,
    test_config Array(Map(String, Decimal(28, 12))),
    ncp UInt8
)
PRIMARY KEY test_id
SOURCE(clickhouse(TABLE 'dict_nested_map_test_table'))
LIFETIME(MIN 1 MAX 1000000)
LAYOUT(HASHED());

SELECT dictGet('dict_nested_map_dictionary', 'test_config', toUInt64(3));