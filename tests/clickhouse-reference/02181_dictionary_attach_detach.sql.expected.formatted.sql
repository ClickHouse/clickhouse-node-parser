DROP TABLE IF EXISTS `02181_test_table`;

CREATE TABLE `02181_test_table`
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO `02181_test_table`;

DROP DICTIONARY IF EXISTS `02181_test_dictionary`;

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

DROP DICTIONARY `02181_test_dictionary`;

DROP TABLE `02181_test_table`;