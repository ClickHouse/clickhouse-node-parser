SET optimize_move_to_prewhere = 1; -- works only for PREWHERE
CREATE TABLE t1 (a UInt64, b UInt64, c UInt64, d UInt64) ENGINE = Memory;
