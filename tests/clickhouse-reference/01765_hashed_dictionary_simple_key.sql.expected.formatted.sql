SELECT
    dictGet('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01765_db.hashed_dictionary_simple_key_simple_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01765_db`.hashed_dictionary_simple_key_simple_attributes
ORDER BY id ASC;

SELECT
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01765_db.sparse_hashed_dictionary_simple_key_simple_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01765_db`.sparse_hashed_dictionary_simple_key_simple_attributes
ORDER BY id ASC;

SELECT
    dictGet('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.hashed_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01765_db.hashed_dictionary_simple_key_complex_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01765_db`.hashed_dictionary_simple_key_complex_attributes
ORDER BY id ASC;

SELECT
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_first', number) AS value_first,
    dictGet('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_second', number) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_first', number, toString('default')) AS value_first,
    dictGetOrDefault('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', 'value_second', number, toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01765_db.sparse_hashed_dictionary_simple_key_complex_attributes', number)
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01765_db`.sparse_hashed_dictionary_simple_key_complex_attributes
ORDER BY id ASC;

SELECT dictGet('01765_db.hashed_dictionary_simple_key_hierarchy', 'parent_id', number)
FROM `system`.numbers
LIMIT 5;

SELECT dictGetHierarchy('01765_db.hashed_dictionary_simple_key_hierarchy', toUInt64(1));

SELECT dictGetHierarchy('01765_db.hashed_dictionary_simple_key_hierarchy', toUInt64(4));

SELECT dictGet('01765_db.sparse_hashed_dictionary_simple_key_hierarchy', 'parent_id', number)
FROM `system`.numbers
LIMIT 5;

SELECT dictGetHierarchy('01765_db.sparse_hashed_dictionary_simple_key_hierarchy', toUInt64(1));

SELECT dictGetHierarchy('01765_db.sparse_hashed_dictionary_simple_key_hierarchy', toUInt64(4));