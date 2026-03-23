SET enable_json_type = 1;

SET allow_experimental_variant_type = 1;

SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory();

INSERT INTO t0 (c0);

INSERT INTO t0 (c0, c1);

SYSTEM DROP  TABLE t0;