SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Date
)
ENGINE = MergeTree()
ORDER BY tuple()
TTL (materialize(c0));

SYSTEM DROP  TABLE t0;