CREATE TABLE always_alive_ids (id UInt64) engine=Memory();
CREATE DICTIONARY always_alive_ids_dict (id UInt64) PRIMARY KEY id SOURCE(CLICKHOUSE(TABLE 'always_alive_ids')) LAYOUT(HASHED()) LIFETIME(0);
CREATE TABLE ttl_dict (id UInt64, event_date Date) ENGINE = MergeTree ORDER BY (id) TTL event_date + INTERVAL 1 MONTH WHERE NOT dictHas({CLICKHOUSE_DATABASE:String} || '.always_alive_ids_dict', id);
SELECT id FROM ttl_dict ORDER BY id;
