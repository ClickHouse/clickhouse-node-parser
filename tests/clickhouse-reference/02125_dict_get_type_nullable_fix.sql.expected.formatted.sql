CREATE TABLE `02125_test_table`
(
    id UInt64,
    value Nullable(String)
)
ENGINE = TinyLog;

CREATE DICTIONARY `02125_test_dictionary`
(
    id UInt64,
    value Nullable(String)
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02125_test_table'))
LAYOUT(DIRECT());

SELECT dictGet('02125_test_dictionary', 'value', toUInt64(0));

SELECT dictGetString('02125_test_dictionary', 'value', toUInt64(0)); --{serverError TYPE_MISMATCH}