CREATE TABLE source_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY tuple();

-- There is no "CLICKHOUSEX" dictionary source, so the next query must fail even if `dictionaries_lazy_load` is enabled.
CREATE DICTIONARY id_value_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhousex(TABLE 'source_table'))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT()); -- { serverError UNKNOWN_ELEMENT_IN_CONFIG }

SELECT count()
FROM `system`.dictionaries
WHERE name == 'id_value_dictionary'
    AND database == currentDatabase();