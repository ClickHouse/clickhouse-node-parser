CREATE TABLE regexp_dictionary_source_table
(
    id UInt64,
    parent_id UInt64,
    regexp String,
    keys Array(String),
    values Array(String)
)
ENGINE = TinyLog;

CREATE DICTIONARY regexp_dict1
(
    regexp String,
    name String,
    version Nullable(UInt64),
    comment String DEFAULT 'nothing'
)
PRIMARY KEY (regexp)
SOURCE(clickhouse(TABLE 'regexp_dictionary_source_table'))
LIFETIME(0)
LAYOUT(REGEXP_TREE());

SELECT *
FROM dictionary(regexp_dict1);

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), 'Linux/101.tlinux');

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), '33/tclwebkit11.10x');

SELECT dictGet('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit');

SELECT dictGetOrDefault('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit', ('', 0, 'default'));

CREATE TABLE needle_table
(
    key String
)
ENGINE = TinyLog;

SELECT *
FROM needle_table;

SELECT dictGet(regexp_dict1, ('name', 'version'), key)
FROM needle_table;

SELECT dictGet(regexp_dict1, ('name', 'version', 'comment'), '33/tclwebkit');