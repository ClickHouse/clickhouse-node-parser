CREATE TABLE iif_test
(    
    value Int32,
    name String
) ENGINE = Memory;
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
set dialect = 'clickhouse';
