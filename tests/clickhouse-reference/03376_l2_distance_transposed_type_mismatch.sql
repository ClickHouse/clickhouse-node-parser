-- Tags: no-parallel-replicas
-- No parallel replicas because: https://github.com/ClickHouse/ClickHouse/issues/74367

-- https://github.com/ClickHouse/ClickHouse/issues/89976
-- Check whether the distance is calculated correctly when query_vec has a different type than qbit

DROP TABLE IF EXISTS test;
CREATE TABLE test 
(
    id UInt32, 
    qbit QBit(Float32, 16)
)
ENGINE = MergeTree
ORDER BY id;
INSERT INTO test VALUES (1, [-0.042587746,0.029204812,-0.018542241,-0.0006326993,-0.046840265,0.017869968,-0.036177695,0.008778641,-0.0062302556,0.030549359,-0.009787052,-0.01996496,-0.0034493103,-0.01415683,-0.04583967,-0.047684517]);
DROP TABLE test;
