SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    id String,
    dealer_id String
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS index_granularity = 8192;

INSERT INTO t (id, dealer_id);

SELECT *
FROM t;

SET mutations_sync = 1;

SELECT '---';

SYSTEM DROP  TABLE t;