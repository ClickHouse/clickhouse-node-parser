DROP DICTIONARY IF EXISTS {CLICKHOUSE_DATABASE:Identifier}.test_dict_01051_d;

DROP TABLE IF EXISTS {CLICKHOUSE_DATABASE:Identifier}.test_01051_d;

DROP TABLE IF EXISTS {CLICKHOUSE_DATABASE:Identifier}.test_view_01051_d;

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.test_01051_d
(
    key UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY key;

CREATE VIEW {CLICKHOUSE_DATABASE:Identifier}.test_view_01051_d (key UInt64, value String)
AS
SELECT
    k2 + 1 AS key,
    concat(v2, '_x') AS value
FROM (
        SELECT
            key + 2 AS k2,
            concat(value, '_y') AS v2
        FROM test_01051_d
    );

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.test_01051_d;

CREATE DICTIONARY {CLICKHOUSE_DATABASE:Identifier}.test_dict_01051_d
(
    key UInt64,
    value String
)
PRIMARY KEY key
SOURCE(clickhouse(host 'localhost' port '9000' user 'default' password '' db currentDatabase() table 'test_view_01051_d'))
LIFETIME(100500)
LAYOUT(FLAT());

SELECT dictGet(concat({CLICKHOUSE_DATABASE:String}, '.test_dict_01051_d'), 'value', toUInt64(4));