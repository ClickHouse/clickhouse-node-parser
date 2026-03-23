SET max_threads = 1;

SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Variant(String, Int)
)
ENGINE = MergeTree()
PRIMARY KEY tuple()
SETTINGS use_compact_variant_discriminators_serialization = 0, index_granularity = 1;

INSERT INTO t0 (c0);

SELECT c0
FROM t0;

SYSTEM DROP  TABLE t0;