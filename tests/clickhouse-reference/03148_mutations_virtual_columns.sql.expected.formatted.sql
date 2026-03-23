DROP TABLE IF EXISTS t_mut_virtuals;

CREATE TABLE t_mut_virtuals
(
    id UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_mut_virtuals;

INSERT INTO t_mut_virtuals;

SET insert_keeper_fault_injection_probability = 0;

SET mutations_sync = 2;

SELECT *
FROM t_mut_virtuals
ORDER BY id ASC;

DROP TABLE t_mut_virtuals;