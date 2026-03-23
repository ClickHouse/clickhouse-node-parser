CREATE TABLE test (id UInt64, value String) ENGINE=MergeTree ORDER BY id;
INSERT INTO test SELECT number, 'str_' || toString(number) FROM numbers(10);
CREATE DICTIONARY test_dict
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE test))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000);
CREATE TABLE view_source (id UInt64) ENGINE=MergeTree ORDER BY id;
INSERT INTO view_source SELECT * FROM numbers(5);
CREATE VIEW view AS SELECT id, dictGet('test_dict', 'value', id) as value FROM view_source;
CREATE OR REPLACE DICTIONARY test_dict
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE view))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000); -- {serverError INFINITE_LOOP}
CREATE DICTIONARY test_dict_2
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE view))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000);
CREATE OR REPLACE DICTIONARY test_dict_2
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE view))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000);
