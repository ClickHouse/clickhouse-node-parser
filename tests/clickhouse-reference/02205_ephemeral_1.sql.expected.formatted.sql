SET mutations_sync = 2;

SYSTEM DROP  TABLE IF EXISTS t_ephemeral_02205_1;

CREATE TABLE t_ephemeral_02205_1
(
    x UInt32 DEFAULT y,
    y UInt32 EPHEMERAL 17,
    z UInt32 DEFAULT 5
)
ENGINE = Memory;

INSERT INTO t_ephemeral_02205_1;

SELECT *
FROM t_ephemeral_02205_1;