-- Tags: no-ordinary-database
-- Tests that various lifetime conditions are checked during creation of a dictionary
-- Github issue #78314
SYSTEM DROP  DICTIONARY IF EXISTS dict;

SYSTEM DROP  TABLE IF EXISTS tbl;

CREATE TABLE tbl
(
    col Int
)
ENGINE = Memory;

CREATE DICTIONARY dict
(
    col Int DEFAULT 1
)
PRIMARY KEY (col)
SOURCE(clickhouse(TABLE 'tbl'))
LIFETIME(MIN 1 MAX 0)
LAYOUT(HASHED_ARRAY()); -- { serverError BAD_ARGUMENTS }

SYSTEM DROP  TABLE tbl;