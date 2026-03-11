SELECT
    dictGet('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_first', (number, concat('id_key_', toString(number)))) AS value_first,
    dictGet('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_second', (number, concat('id_key_', toString(number)))) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_first', (number, concat('id_key_', toString(number)))) AS value_first,
    dictGet('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_second', (number, concat('id_key_', toString(number)))) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_first', (number, concat('id_key_', toString(number))), toString('default')) AS value_first,
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_second', (number, concat('id_key_', toString(number))), toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_first', (number, concat('id_key_', toString(number))), toString('default')) AS value_first,
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_simple_attributes', 'value_second', (number, concat('id_key_', toString(number))), toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01766_db.hashed_dictionary_complex_key_simple_attributes', (number, concat('id_key_', toString(number))))
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01766_db`.hashed_dictionary_complex_key_simple_attributes
ORDER BY (id, id_key) ASC;

SELECT
    dictGet('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_first', (number, concat('id_key_', toString(number)))) AS value_first,
    dictGet('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_second', (number, concat('id_key_', toString(number)))) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGet('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_first', (number, concat('id_key_', toString(number)))) AS value_first,
    dictGet('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_second', (number, concat('id_key_', toString(number)))) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_first', (number, concat('id_key_', toString(number))), toString('default')) AS value_first,
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_second', (number, concat('id_key_', toString(number))), toString('default')) AS value_second
FROM `system`.numbers
LIMIT 3;

SELECT
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_first', (number, concat('id_key_', toString(number))), toString('default')) AS value_first,
    dictGetOrDefault('01766_db.hashed_dictionary_complex_key_complex_attributes', 'value_second', (number, concat('id_key_', toString(number))), toString('default')) AS value_second
FROM `system`.numbers
LIMIT 4;

SELECT dictHas('01766_db.hashed_dictionary_complex_key_complex_attributes', (number, concat('id_key_', toString(number))))
FROM `system`.numbers
LIMIT 4;

SELECT *
FROM `01766_db`.hashed_dictionary_complex_key_complex_attributes
ORDER BY (id, id_key) ASC;