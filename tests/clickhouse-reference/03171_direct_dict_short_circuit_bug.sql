SELECT
    toUInt128(1),
    dictGetOrDefault('direct_dictionary_simple_key_simple_attributes', 'value_second', number, toString(toFixedString(toFixedString(toFixedString(materialize('default'), 7), 7), toUInt128(7)))) AS value_second
FROM system.numbers LIMIT 255
FORMAT Null;
