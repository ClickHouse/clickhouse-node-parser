SET enable_analyzer = 1;

SET enable_parallel_replicas = 0;

SET enable_join_runtime_filters = 0;

DROP TABLE IF EXISTS t1;

DROP TABLE IF EXISTS t2;

CREATE TABLE t1
(
    x Int32,
    y String
)
ENGINE = Memory;

CREATE TABLE t2
(
    x Int32,
    y String
)
ENGINE = Memory;

INSERT INTO t1;

INSERT INTO t2;