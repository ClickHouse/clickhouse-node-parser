SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    s LowCardinality(String),
    client_name String
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT
    if(number < 8000, 'ok', 'fail') AS s,
    if(number < 8000, 'client1', 'client2')
FROM numbers(20000);

SELECT DISTINCT lowCardinalityKeys(s)
FROM test
PREWHERE client_name = 'client1'
ORDER BY `ALL` ASC;

SYSTEM DROP  TABLE test;