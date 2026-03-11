SELECT dictGet('test_dictionary_non_nullable', 'value', NULL);
SELECT dictGet('test_dictionary_non_nullable', 'value', arrayJoin([toUInt64(0), NULL, 1]));
SELECT dictGet('test_dictionary_nullable', 'value', NULL);
SELECT dictGet('test_dictionary_nullable', 'value', arrayJoin([toUInt64(0), NULL, 1, 2]));
