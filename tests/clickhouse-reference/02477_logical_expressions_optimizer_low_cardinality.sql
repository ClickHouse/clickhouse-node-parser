DROP TABLE IF EXISTS t_logical_expressions_optimizer_low_cardinality;
set optimize_min_equality_disjunction_chain_length=3;
CREATE TABLE t_logical_expressions_optimizer_low_cardinality (a LowCardinality(String), b UInt32) ENGINE = Memory;
DROP TABLE t_logical_expressions_optimizer_low_cardinality;
