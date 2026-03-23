SET allow_experimental_dynamic_type = 1;

SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO t0 (c0);

SYSTEM DROP  TABLE t0;