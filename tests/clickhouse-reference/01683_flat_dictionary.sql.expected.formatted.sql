SELECT
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01681_database_for_flat_dictionary.flat_dictionary_simple_key_simple_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01681_database_for_flat_dictionary.flat_dictionary_simple_key_complex_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', 'parent_id', number)
FROM `system`.numbers
LIMIT 5;

SELECT dictGetHierarchy('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', toUInt64(1));

SELECT dictGetHierarchy('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', toUInt64(4));