CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier} ENGINE=Replicated('/test/02072/{database}_1', '{shard}', '{replica}_1');
SET distributed_ddl_output_mode='none';
CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.`test%_\_` (n int) engine=Log;
CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier} ENGINE=Replicated('/test/02072/{database}', '{shard}', '{replica}_2');
