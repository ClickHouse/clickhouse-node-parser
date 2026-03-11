SELECT dictGet('range_hashed_dictionary', 'value', toUInt64(1), toUInt64(18446744073709551615));

SELECT dictGet('range_hashed_dictionary', 'value', toUInt64(1), toUInt64(-1));