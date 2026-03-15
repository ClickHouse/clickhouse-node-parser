CREATE TABLE polygons_test_table
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
ENGINE = TinyLog;

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