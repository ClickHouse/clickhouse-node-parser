SET convert_query_to_cnf = 1;

SET optimize_using_constraints = 1;

SET optimize_append_index = 0;

DROP TABLE IF EXISTS t_constraints_where;

CREATE TABLE t_constraints_where
(
    a UInt32,
    b UInt32,
    CONSTRAINT c1 ASSUME b >= 5,
    CONSTRAINT c2 ASSUME b <= 10
)
ENGINE = Memory;

INSERT INTO t_constraints_where;

DROP TABLE t_constraints_where;

CREATE TABLE t_constraints_where
(
    a UInt32,
    b UInt32,
    CONSTRAINT c1 ASSUME b < 10
)
ENGINE = Memory;