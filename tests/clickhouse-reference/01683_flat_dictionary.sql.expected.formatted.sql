CREATE DATABASE `01681_database_for_flat_dictionary`;

CREATE TABLE `01681_database_for_flat_dictionary`.simple_key_simple_attributes_source_table
(
    id UInt64,
    value_first String,
    value_second String
)
ENGINE = TinyLog;

CREATE DICTIONARY `01681_database_for_flat_dictionary`.flat_dictionary_simple_key_simple_attributes
(
    id UInt64,
    value_first String DEFAULT 'value_first_default',
    value_second String DEFAULT 'value_second_default'
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'simple_key_simple_attributes_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());

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

CREATE TABLE `01681_database_for_flat_dictionary`.simple_key_complex_attributes_source_table
(
    id UInt64,
    value_first String,
    value_second Nullable(String)
)
ENGINE = TinyLog;

CREATE DICTIONARY `01681_database_for_flat_dictionary`.flat_dictionary_simple_key_complex_attributes
(
    id UInt64,
    value_first String DEFAULT 'value_first_default',
    value_second Nullable(String) DEFAULT 'value_second_default'
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'simple_key_complex_attributes_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());

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

CREATE TABLE `01681_database_for_flat_dictionary`.simple_key_hierarchy_table
(
    id UInt64,
    parent_id UInt64
)
ENGINE = TinyLog();

CREATE DICTIONARY `01681_database_for_flat_dictionary`.flat_dictionary_simple_key_hierarchy
(
    id UInt64,
    parent_id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'simple_key_hierarchy_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());

SELECT dictGet('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', 'parent_id', number)
FROM `system`.numbers
LIMIT 5;

SELECT dictGetHierarchy('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', toUInt64(1));

SELECT dictGetHierarchy('01681_database_for_flat_dictionary.flat_dictionary_simple_key_hierarchy', toUInt64(4));