SYSTEM drop  table if exists test;

SYSTEM drop  view if exists v;

SYSTEM drop  dictionary if exists dict;

CREATE TABLE test
(
    x UInt32,
    v String
)
ENGINE = Memory;

CREATE VIEW v (x UInt32, v String)
AS
SELECT
    x,
    v
FROM test;

CREATE DICTIONARY dict
(
    x UInt64,
    v String
)
PRIMARY KEY x
SOURCE(clickhouse(TABLE 'v'))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(FLAT());

SYSTEM drop  view v; -- {serverError HAVE_DEPENDENT_OBJECTS}

CREATE OR REPLACE VIEW v (x UInt32, v String, y UInt32)
AS
SELECT
    x,
    v,
    42 AS y
FROM test;

SYSTEM drop  dictionary dict;

SYSTEM drop  table test;