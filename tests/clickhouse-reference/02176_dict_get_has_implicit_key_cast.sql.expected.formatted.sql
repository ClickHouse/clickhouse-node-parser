SELECT dictGet('02176_test_simple_key_dictionary', 'value', toUInt64(0));

SELECT dictGet('02176_test_simple_key_dictionary', 'value', toUInt8(0));

SELECT dictGet('02176_test_simple_key_dictionary', 'value', '0');

SELECT dictGet('02176_test_simple_key_dictionary', 'value', [0]);

SELECT dictHas('02176_test_simple_key_dictionary', toUInt64(0));

SELECT dictHas('02176_test_simple_key_dictionary', toUInt8(0));

SELECT dictHas('02176_test_simple_key_dictionary', '0');

SELECT dictHas('02176_test_simple_key_dictionary', [0]);

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt64(0), '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt8(0), '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple('0', '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple([0], '0'));

SELECT dictGet('02176_test_complex_key_dictionary', 'value', tuple(toUInt64(0), 0));

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt64(0), '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt8(0), '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple('0', '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple([0], '0'));

SELECT dictHas('02176_test_complex_key_dictionary', tuple(toUInt64(0), 0));