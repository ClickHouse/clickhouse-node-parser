SET convert_query_to_cnf = 0;

SYSTEM DROP  TABLE IF EXISTS n;

SYSTEM DROP  TABLE IF EXISTS r;

CREATE TABLE n
(
    k UInt32
)
ENGINE = Memory;

CREATE TABLE r
(
    k UInt32,
    name String
)
ENGINE = Memory;

SET enable_optimize_predicate_expression = 0;

SYSTEM DROP  TABLE n;

SYSTEM DROP  TABLE r;