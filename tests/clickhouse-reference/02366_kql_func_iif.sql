CREATE TABLE iif_test
(    
    value Int32,
    name String
) ENGINE = Memory;
INSERT INTO iif_test VALUES (10, 'ten'), (20, 'twenty'), (30, 'thirty'), (5, 'five');
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
set dialect = 'clickhouse';
