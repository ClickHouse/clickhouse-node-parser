CREATE TABLE regexp_dictionary_source_table
(
    id UInt64,
    parent_id UInt64,
    regexp String,
    keys   Array(String),
    values Array(String),
) ENGINE=TinyLog;
create dictionary regexp_dict1
(
    regexp String,
    name String,
    version Nullable(UInt64),
    comment String default 'nothing'
)
PRIMARY KEY(regexp)
SOURCE(CLICKHOUSE(TABLE 'regexp_dictionary_source_table'))
LIFETIME(0)
LAYOUT(regexp_tree);
select * from dictionary(regexp_dict1);
select dictGet('regexp_dict1', ('name', 'version', 'comment'), 'Linux/101.tlinux');
select dictGet('regexp_dict1', ('name', 'version', 'comment'), '33/tclwebkit11.10x');
select dictGet('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit');
select dictGetOrDefault('regexp_dict1', ('name', 'version', 'comment'), '30/tclwebkit', ('', 0, 'default'));
CREATE TABLE needle_table
(
    key String
)
ENGINE=TinyLog;
select * from needle_table;
select dictGet(regexp_dict1, ('name', 'version'), key) from needle_table;
select dictGet(regexp_dict1, ('name', 'version', 'comment'), '33/tclwebkit');
