CREATE TABLE iif_test
(
    value Int32,
    name String
)
ENGINE = Memory;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';

SET dialect = 'clickhouse';