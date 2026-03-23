CREATE TABLE 02181_test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;
INSERT INTO 02181_test_table VALUES (0, 'Value');
CREATE DICTIONARY 02181_test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE '02181_test_table'))
LAYOUT(HASHED())
LIFETIME(0);
SELECT * FROM 02181_test_dictionary;
