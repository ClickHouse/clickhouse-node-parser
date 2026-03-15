CREATE TABLE hierarchy_source_table (id UInt64, parent_id UInt64) ENGINE = TinyLog;
CREATE DICTIONARY hierarchy_flat_dictionary
(
    id UInt64,
    parent_id UInt64 HIERARCHICAL
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'hierarchy_source_table'))
LAYOUT(FLAT())
LIFETIME(MIN 1 MAX 1000);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 0);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 1);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 2);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 3);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 4);
SELECT dictGetHierarchy('hierarchy_flat_dictionary', 5);
SELECT dictIsIn('hierarchy_flat_dictionary', 1, 1);
SELECT dictIsIn('hierarchy_flat_dictionary', 2, 1);
SELECT dictIsIn('hierarchy_flat_dictionary', 2, 0);
SELECT dictGetChildren('hierarchy_flat_dictionary', 0);
SELECT dictGetChildren('hierarchy_flat_dictionary', 1);
SELECT dictGetChildren('hierarchy_flat_dictionary', 2);
SELECT dictGetChildren('hierarchy_flat_dictionary', 3);
SELECT dictGetChildren('hierarchy_flat_dictionary', 4);
SELECT dictGetChildren('hierarchy_flat_dictionary', 5);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 0);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 2);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 3);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 4);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 5);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 0, 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 1, 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 2, 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 3, 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 4, 1);
SELECT dictGetDescendants('hierarchy_flat_dictionary', 5, 1);
