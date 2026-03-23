CREATE TABLE `02179_test_table`
(
    id UInt64,
    value String,
    start Int64,
    `end` Int64
)
ENGINE = TinyLog;

INSERT INTO `02179_test_table`;

INSERT INTO `02179_test_table`;

INSERT INTO `02179_test_table`;

CREATE DICTIONARY `02179_test_dictionary`
(
    id UInt64,
    value String DEFAULT 'DefaultValue',
    start Int64,
    `end` Int64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02179_test_table'))
LIFETIME(0)
RANGE(MIN start MAX `end`)
LAYOUT(RANGE_HASHED());

SELECT dictGet('02179_test_dictionary', 'value', 0, 15);

SELECT dictGet('02179_test_dictionary', 'value', 0, 5);

SELECT dictHas('02179_test_dictionary', 0, 15);

SELECT dictHas('02179_test_dictionary', 0, 5);

SELECT *
FROM `02179_test_dictionary`
ORDER BY `ALL` ASC;