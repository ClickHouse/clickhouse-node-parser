SELECT dictGet('test_dictionary', 'value', 0);

SELECT dictGet('test_dictionary', 'value', 0, 'DefaultValue'); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dictGetOrDefault('test_dictionary', 'value', 1, 'DefaultValue');

SELECT dictGetOrDefault('test_dictionary', 'value', 1, 'DefaultValue', 1); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dictGet('range_hashed_dictionary', 'value', 0, toUInt64(4));

SELECT dictGet('range_hashed_dictionary', 'value', 4, toUInt64(6), 'DefaultValue'); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dictGetOrDefault('range_hashed_dictionary', 'value', 1, toUInt64(6), 'DefaultValue');

SELECT dictGetOrDefault('range_hashed_dictionary', 'value', 1, toUInt64(6), 'DefaultValue', 1); --{serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}