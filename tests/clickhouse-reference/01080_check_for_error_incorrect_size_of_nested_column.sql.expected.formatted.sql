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