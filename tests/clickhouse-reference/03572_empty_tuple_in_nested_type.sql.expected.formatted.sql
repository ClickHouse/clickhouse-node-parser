-- { echo ON }
SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Array(Tuple())
)
ENGINE = Memory;

SET max_insert_block_size = 4;

INSERT INTO t0 (c0);

SYSTEM DROP  TABLE t0;

SELECT [(), ()];