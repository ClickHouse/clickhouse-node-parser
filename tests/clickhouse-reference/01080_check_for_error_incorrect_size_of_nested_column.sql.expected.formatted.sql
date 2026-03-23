SYSTEM drop  table if exists {CLICKHOUSE_DATABASE:Identifier}.test_table_01080;

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.test_table_01080
(
    dim_key Int64,
    dim_id String
)
ENGINE = MergeTree
ORDER BY (dim_key);

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.test_table_01080;

SYSTEM drop  DICTIONARY if exists {CLICKHOUSE_DATABASE:Identifier}.test_dict_01080;

CREATE DICTIONARY {CLICKHOUSE_DATABASE:Identifier}.test_dict_01080
(
    dim_key Int64,
    dim_id String
)
PRIMARY KEY dim_key
SOURCE(clickhouse(host 'localhost' port tcpPort() user 'default' password '' db currentDatabase() table 'test_table_01080'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(COMPLEX_KEY_HASHED());

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', tuple(toInt64(1)));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', tuple(toInt64(0)));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(0)) AS x
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(1)) AS x
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(number)) AS x
        FROM numbers(5)
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(rand64() * 0)) AS x
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(blockSize() = 0)) AS x
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(materialize(0))) AS x
    );

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01080'), 'dim_id', x)
FROM (
        SELECT tuple(toInt64(materialize(1))) AS x
    );

SYSTEM drop  DICTIONARY   {CLICKHOUSE_DATABASE:Identifier}.test_dict_01080;

SYSTEM drop  table   {CLICKHOUSE_DATABASE:Identifier}.test_table_01080;