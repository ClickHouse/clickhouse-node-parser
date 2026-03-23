SYSTEM DROP  TABLE IF EXISTS polygons_test_table;

CREATE TABLE polygons_test_table
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
ENGINE = TinyLog;

INSERT INTO polygons_test_table;

SYSTEM DROP  DICTIONARY IF EXISTS polygons_test_dictionary_no_option;

CREATE DICTIONARY polygons_test_dictionary_no_option
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE 'polygons_test_table'))
LIFETIME(0)
LAYOUT(POLYGON());

SELECT *
FROM polygons_test_dictionary_no_option; -- {serverError UNSUPPORTED_METHOD}

SYSTEM DROP  DICTIONARY IF EXISTS polygons_test_dictionary;

CREATE DICTIONARY polygons_test_dictionary
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE 'polygons_test_table'))
LIFETIME(0)
LAYOUT(POLYGON(STORE_POLYGON_KEY_COLUMN 1));

SELECT *
FROM polygons_test_dictionary;

SYSTEM DROP  DICTIONARY polygons_test_dictionary_no_option;

SYSTEM DROP  DICTIONARY polygons_test_dictionary;

SYSTEM DROP  TABLE polygons_test_table;