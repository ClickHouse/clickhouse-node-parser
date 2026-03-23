SYSTEM DROP  TABLE if exists t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory;

INSERT INTO t0 (c0); -- { error TYPE_MISMATCH }

SYSTEM DROP  TABLE t0;