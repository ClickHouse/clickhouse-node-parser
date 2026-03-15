CREATE TABLE local
(
    x UInt8
)
ENGINE = Memory;

CREATE TABLE distributed AS local
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), local, x);

SET distributed_foreground_insert = 0, network_compression_method = 'zstd';

SELECT count()
FROM local;

SELECT count()
FROM distributed;