CREATE TABLE 02179_test_table
(
    id UInt64,
    value String,
    start Int64,
    end Int64
) Engine = TinyLog;
CREATE DICTIONARY 02179_test_dictionary
(
    id UInt64,
    value String DEFAULT 'DefaultValue',
    start Int64,
    end Int64
) PRIMARY KEY id
LAYOUT(RANGE_HASHED())
SOURCE(CLICKHOUSE(TABLE '02179_test_table'))
RANGE(MIN start MAX end)
LIFETIME(0);
SELECT dictGet('02179_test_dictionary', 'value', 0, 15);
SELECT dictGet('02179_test_dictionary', 'value', 0, 5);
SELECT dictHas('02179_test_dictionary', 0, 15);
SELECT dictHas('02179_test_dictionary', 0, 5);
SELECT * FROM 02179_test_dictionary ORDER BY ALL;
