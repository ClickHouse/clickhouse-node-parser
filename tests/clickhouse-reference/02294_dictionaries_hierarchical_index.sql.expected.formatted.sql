CREATE TABLE test_hierarchy_source_table
(
    id UInt64,
    parent_id UInt64
)
ENGINE = MergeTree
ORDER BY id;

CREATE DICTIONARY hierarchy_flat_dictionary_index
(
    id UInt64,
    parent_id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_hierarchy_source_table'))
LIFETIME(0)
LAYOUT(FLAT()); -- {serverError BAD_ARGUMENTS }

CREATE DICTIONARY hierarchy_flat_dictionary_index
(
    id UInt64,
    parent_id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_hierarchy_source_table'))
LIFETIME(0)
LAYOUT(FLAT());

SELECT *
FROM hierarchy_flat_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_flat_dictionary_index'
    AND database = currentDatabase();

CREATE DICTIONARY hierarchy_hashed_dictionary_index
(
    id UInt64,
    parent_id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_hierarchy_source_table'))
LIFETIME(0)
LAYOUT(FLAT());

SELECT *
FROM hierarchy_hashed_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_hashed_dictionary_index'
    AND database = currentDatabase();

CREATE DICTIONARY hierarchy_hashed_array_dictionary_index
(
    id UInt64,
    parent_id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_hierarchy_source_table'))
LIFETIME(0)
LAYOUT(HASHED_ARRAY());

SELECT *
FROM hierarchy_hashed_array_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_hashed_array_dictionary_index'
    AND database = currentDatabase();