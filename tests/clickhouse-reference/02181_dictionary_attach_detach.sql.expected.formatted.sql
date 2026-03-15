CREATE TABLE `02181_test_table`
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

CREATE DICTIONARY `02181_test_dictionary`
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02181_test_table'))
LIFETIME(0)
LAYOUT(HASHED());

SELECT *
FROM `02181_test_dictionary`;