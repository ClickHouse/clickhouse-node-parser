SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', tuple(toInt64(1)));
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', tuple(toInt64(0)));
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x)  from (select tuple(toInt64(0)) as x);
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x)  from (select tuple(toInt64(1)) as x);
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x)  from (select tuple(toInt64(number)) as x from numbers(5));
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x) from (select tuple(toInt64(rand64()*0)) as x);
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x) from (select tuple(toInt64(blockSize()=0)) as x);
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x) from (select tuple(toInt64(materialize(0))) as x);
select dictGetString({CLICKHOUSE_DATABASE:String} || '.test_dict_01080', 'dim_id', x) from (select tuple(toInt64(materialize(1))) as x);
