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