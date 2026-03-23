CREATE TABLE `02176_test_simple_key_table`
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO `02176_test_simple_key_table`;

CREATE DICTIONARY `02176_test_simple_key_dictionary`
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02176_test_simple_key_table'))
LAYOUT(DIRECT());

SELECT dictGet('02176_test_simple_key_dictionary', 'value', toUInt64(0));

SELECT dictGet('02176_test_simple_key_dictionary', 'value', toUInt8(0));

SELECT dictGet('02176_test_simple_key_dictionary', 'value', '0');

SELECT dictGet('02176_test_simple_key_dictionary', 'value', [0]); --{serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dictHas('02176_test_simple_key_dictionary', toUInt64(0));

SELECT dictHas('02176_test_simple_key_dictionary', toUInt8(0));

SELECT dictHas('02176_test_simple_key_dictionary', '0');

SELECT dictHas('02176_test_simple_key_dictionary', [0]); --{serverError ILLEGAL_TYPE_OF_ARGUMENT}

CREATE TABLE `02176_test_complex_key_table`
(
    id UInt64,
    id_key String,
    value String
)
ENGINE = TinyLog;

INSERT INTO `02176_test_complex_key_table`;

CREATE DICTIONARY `02176_test_complex_key_dictionary`
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(clickhouse(TABLE '02176_test_complex_key_table'))
LAYOUT(COMPLEX_KEY_DIRECT());

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt64(0), '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt8(0), '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple('0', '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple([0], '0')); --{serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt64(0), 0));

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt64(0), '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt8(0), '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple('0', '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple([0], '0')); --{serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt64(0), 0));