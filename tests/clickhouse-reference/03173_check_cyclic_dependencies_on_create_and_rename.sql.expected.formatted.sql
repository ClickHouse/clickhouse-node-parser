-- Tags: atomic-database
SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test SELECT
    number,
    concat('str_', toString(number))
FROM numbers(10);

SYSTEM DROP  DICTIONARY IF EXISTS test_dict;

CREATE DICTIONARY test_dict
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE test))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

SYSTEM DROP  TABLE IF EXISTS view_source;

CREATE TABLE view_source
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO view_source SELECT *
FROM numbers(5);

SYSTEM DROP  VIEW IF EXISTS view;

CREATE VIEW view
AS
SELECT
    id,
    dictGet('test_dict', 'value', id) AS value
FROM view_source;

CREATE OR REPLACE DICTIONARY test_dict
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE view))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT()); -- {serverError INFINITE_LOOP}

SYSTEM DROP  DICTIONARY IF EXISTS test_dict_2;

CREATE DICTIONARY test_dict_2
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE view))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

SYSTEM DROP  DICTIONARY test_dict_2;

CREATE OR REPLACE DICTIONARY test_dict_2
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE view))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

SYSTEM DROP  DICTIONARY test_dict;

SYSTEM DROP  VIEW view;

SYSTEM DROP  TABLE test;

SYSTEM DROP  TABLE view_source;