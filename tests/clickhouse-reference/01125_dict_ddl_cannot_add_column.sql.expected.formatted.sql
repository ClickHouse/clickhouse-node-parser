CREATE TABLE date_table
(
    id UInt32,
    val String,
    start Date,
    `end` Date
)
ENGINE = Memory();

CREATE DICTIONARY somedict
(
    id UInt32,
    val String,
    start Date,
    `end` Date
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'date_table' DB currentDatabase()))
LIFETIME(MIN 300 MAX 360)
RANGE(MIN start MAX `end`)
LAYOUT(RANGE_HASHED());

SELECT *
FROM somedict;

-- No dictionary columns
SELECT 1
FROM somedict;