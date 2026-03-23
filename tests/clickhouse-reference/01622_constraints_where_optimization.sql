SET convert_query_to_cnf = 1;
SET optimize_using_constraints = 1;
SET optimize_append_index = 0;
CREATE TABLE t_constraints_where(a UInt32, b UInt32, CONSTRAINT c1 ASSUME b >= 5, CONSTRAINT c2 ASSUME b <= 10) ENGINE = Memory;
INSERT INTO t_constraints_where VALUES (1, 7);
CREATE TABLE t_constraints_where(a UInt32, b UInt32, CONSTRAINT c1 ASSUME b < 10) ENGINE = Memory;
