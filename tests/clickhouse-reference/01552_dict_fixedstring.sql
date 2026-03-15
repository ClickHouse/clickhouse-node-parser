CREATE TABLE src (k UInt64, s FixedString(11)) ENGINE = Memory;
CREATE DICTIONARY dict
(
    k UInt64,
    s String
)
PRIMARY KEY k
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER default TABLE 'src'))
LAYOUT(FLAT)
LIFETIME(MIN 10 MAX 10);
SELECT dictGet(currentDatabase() || '.dict', 's', number) FROM numbers(2);
