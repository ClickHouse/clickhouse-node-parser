CREATE DICTIONARY dict_01864
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'does_not_exists'))
LIFETIME(MIN 0 MAX 1000)
RANGE(MIN `first` MAX `last`)
LAYOUT(RANGE_HASHED()); -- { serverError INCORRECT_DICTIONARY_DEFINITION }