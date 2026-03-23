-- Test iif() function in KQL dialect
SYSTEM DROP  TABLE IF EXISTS iif_test;

CREATE TABLE iif_test
(
    value Int32,
    name String
)
ENGINE = Memory;

INSERT INTO iif_test;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';

SET dialect = 'clickhouse';