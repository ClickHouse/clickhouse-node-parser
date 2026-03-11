SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', toUInt64(2), toUInt64(1));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', toUInt64(22), toUInt64(11));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(22)), toUInt64(11));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', toUInt64(11), materialize(toUInt64(22)));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(22)), materialize(toUInt64(11)));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', toUInt64(22), toUInt64(111));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(22)), toUInt64(111));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', toUInt64(11), materialize(toUInt64(222)));

SELECT dictIsIn('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(22)), materialize(toUInt64(111)));

SELECT dictGetHierarchy('database_for_dict.dictionary_with_hierarchy', toUInt64(11));

SELECT dictGetHierarchy('database_for_dict.dictionary_with_hierarchy', toUInt64(22));

SELECT dictGetHierarchy('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(11)));

SELECT dictGetHierarchy('database_for_dict.dictionary_with_hierarchy', materialize(toUInt64(22)));