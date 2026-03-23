CREATE TABLE always_alive_ids
(
    id UInt64
)
ENGINE = Memory();

INSERT INTO always_alive_ids;

CREATE DICTIONARY always_alive_ids_dict
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'always_alive_ids'))
LIFETIME(0)
LAYOUT(HASHED());

CREATE TABLE ttl_dict
(
    id UInt64,
    event_date Date
)
ENGINE = MergeTree
ORDER BY (id)
TTL event_date + toIntervalMonth(1) WHERE NOT dictHas(concat({CLICKHOUSE_DATABASE:String}, '.always_alive_ids_dict'), id);

INSERT INTO ttl_dict;

SELECT id
FROM ttl_dict
ORDER BY id ASC;