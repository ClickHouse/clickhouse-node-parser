DROP TABLE IF EXISTS t1;

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(SEMI, `ALL`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(SEMI, `INNER`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(SEMI, `FULL`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(ANTI, `ALL`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(ANTI, `INNER`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(ANTI, `FULL`, a); -- { serverError BAD_ARGUMENTS }

CREATE TABLE t1
(
    a Int64,
    b Int64
)
ENGINE = Join(`ANY`, `FULL`, a); -- { serverError NOT_IMPLEMENTED }