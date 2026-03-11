SELECT dictGet('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_first', number) as value_first,
    dictGet('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_second', number) as value_second FROM system.numbers LIMIT 3;
SELECT dictGet('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_first', number) as value_first,
    dictGet('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_second', number) as value_second FROM system.numbers LIMIT 4;
SELECT dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) as value_first,
    dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) as value_second FROM system.numbers LIMIT 3;
SELECT dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) as value_first,
    dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) as value_second FROM system.numbers LIMIT 4;
SELECT dictHas('01753_dictionary_db.direct_dictionary_simple_key_simple_attributes', number) FROM system.numbers LIMIT 4;
SELECT * FROM 01753_dictionary_db.direct_dictionary_simple_key_simple_attributes ORDER BY ALL;
SELECT dictGet('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_first', number) as value_first,
    dictGet('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_second', number) as value_second FROM system.numbers LIMIT 3;
SELECT dictGet('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_first', number) as value_first,
    dictGet('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_second', number) as value_second FROM system.numbers LIMIT 4;
SELECT dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) as value_first,
    dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) as value_second FROM system.numbers LIMIT 3;
SELECT dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) as value_first,
    dictGetOrDefault('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) as value_second FROM system.numbers LIMIT 4;
SELECT dictHas('01753_dictionary_db.direct_dictionary_simple_key_complex_attributes', number) FROM system.numbers LIMIT 4;
SELECT * FROM 01753_dictionary_db.direct_dictionary_simple_key_complex_attributes ORDER BY ALL;
SELECT dictGet('01753_dictionary_db.direct_dictionary_simple_key_hierarchy', 'parent_id', number) FROM system.numbers LIMIT 5;
SELECT dictGetHierarchy('01753_dictionary_db.direct_dictionary_simple_key_hierarchy', toUInt64(1));
SELECT dictGetHierarchy('01753_dictionary_db.direct_dictionary_simple_key_hierarchy', toUInt64(4));
