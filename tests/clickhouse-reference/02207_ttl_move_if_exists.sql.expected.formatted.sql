CREATE TABLE t_ttl_move_if_exists
(
    d DateTime,
    a UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
TTL d;