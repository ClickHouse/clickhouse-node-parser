CREATE TABLE ttl_sparse_repro
(
    a UInt64,
    dt DateTime,
    b UInt64 TTL dt + INTERVAL 2 SECOND, c UInt64
)
ENGINE = MergeTree ORDER BY a SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;
SELECT sum(c) FROM ttl_sparse_repro;
SELECT sleep(3) FORMAT Null;
