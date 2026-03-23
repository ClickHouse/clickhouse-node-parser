CREATE DATABASE dict_db_02179;

CREATE TABLE dict_db_02179.dict_data
(
    key UInt64,
    val UInt64
)
ENGINE = Memory();

CREATE DICTIONARY dict_db_02179.dict
(
    key UInt64 DEFAULT 0,
    val UInt64 DEFAULT 10
)
PRIMARY KEY key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'dict_data' PASSWORD '' DB 'dict_db_02179'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(FLAT());

INSERT INTO dict_db_02179.dict_data;

SELECT query_count
FROM `system`.dictionaries
WHERE database = 'dict_db_02179'
    AND name = 'dict';

SELECT dictGetUInt64('dict_db_02179.dict', 'val', toUInt64(0));

SET distributed_ddl_output_mode = 'throw';

SET distributed_ddl_output_mode = 'none';

SELECT dictGetUInt64('dict_db_02179.dict', 'val', toUInt64(1));

CREATE DATABASE empty_db_02179;