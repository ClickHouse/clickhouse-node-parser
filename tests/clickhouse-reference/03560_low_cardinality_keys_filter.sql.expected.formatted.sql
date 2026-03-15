CREATE TABLE test
(
    s LowCardinality(String),
    client_name String
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT lowCardinalityKeys(s)
FROM test
PREWHERE client_name = 'client1'
ORDER BY `ALL` ASC;