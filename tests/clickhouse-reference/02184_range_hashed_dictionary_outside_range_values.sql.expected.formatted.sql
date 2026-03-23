CREATE TABLE `02184_range_dictionary_source_table`
(
    id UInt64,
    start UInt64,
    `end` UInt64,
    value_0 String,
    value_1 String,
    value_2 String
)
ENGINE = TinyLog;

INSERT INTO `02184_range_dictionary_source_table`;

CREATE DICTIONARY `02184_range_dictionary`
(
    id UInt64,
    start UInt64,
    `end` UInt64,
    value_0 String,
    value_1 String,
    value_2 String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02184_range_dictionary_source_table'))
LIFETIME(0)
RANGE(MIN start MAX `end`)
LAYOUT(RANGE_HASHED());

SELECT *
FROM `02184_range_dictionary`;

SELECT dictGet('02184_range_dictionary', ('value_0', 'value_1', 'value_2'), 1, 18446744073709551615);

SELECT dictHas('02184_range_dictionary', 1, 18446744073709551615);