CREATE TABLE test
(
    id UInt32,
    qbit QBit(Float32, 16)
)
ENGINE = MergeTree
ORDER BY id;