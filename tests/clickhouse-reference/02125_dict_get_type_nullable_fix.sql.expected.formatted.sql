SELECT dictGet('02125_test_dictionary', 'value', toUInt64(0));

SELECT dictGetString('02125_test_dictionary', 'value', toUInt64(0)); --{serverError TYPE_MISMATCH}