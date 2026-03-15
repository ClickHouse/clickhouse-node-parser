CREATE TABLE test_hierarchy_source_table
(
    id UInt64,
    parent_id UInt64
) ENGINE=MergeTree ORDER BY id;
CREATE DICTIONARY hierarchy_flat_dictionary_index
(
    id UInt64,
    parent_id UInt64 BIDIRECTIONAL
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'test_hierarchy_source_table'))
LAYOUT(FLAT())
LIFETIME(0); -- {serverError BAD_ARGUMENTS }
CREATE DICTIONARY hierarchy_flat_dictionary_index
(
    id UInt64,
    parent_id UInt64 HIERARCHICAL BIDIRECTIONAL
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'test_hierarchy_source_table'))
LAYOUT(FLAT())
LIFETIME(0);
SELECT * FROM hierarchy_flat_dictionary_index;
SELECT hierarchical_index_bytes_allocated > 0 FROM system.dictionaries WHERE name = 'hierarchy_flat_dictionary_index' AND database = currentDatabase();
CREATE DICTIONARY hierarchy_hashed_dictionary_index
(
    id UInt64,
    parent_id UInt64 HIERARCHICAL BIDIRECTIONAL
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'test_hierarchy_source_table'))
LAYOUT(FLAT())
LIFETIME(0);
SELECT * FROM hierarchy_hashed_dictionary_index;
SELECT hierarchical_index_bytes_allocated > 0 FROM system.dictionaries WHERE name = 'hierarchy_hashed_dictionary_index' AND database = currentDatabase();
CREATE DICTIONARY hierarchy_hashed_array_dictionary_index
(
    id UInt64,
    parent_id UInt64 HIERARCHICAL
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'test_hierarchy_source_table'))
LAYOUT(HASHED_ARRAY())
LIFETIME(0);
SELECT * FROM hierarchy_hashed_array_dictionary_index;
SELECT hierarchical_index_bytes_allocated > 0 FROM system.dictionaries WHERE name = 'hierarchy_hashed_array_dictionary_index' AND database = currentDatabase();
