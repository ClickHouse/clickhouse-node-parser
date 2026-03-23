SELECT tupleConcat(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT tupleConcat((1, 'y'), 1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT tupleConcat((1, 'y'), (2, 'n'));

SELECT tupleConcat((1, 'y'), (2, 'n'), (3, 'n'));

SYSTEM DROP  TABLE IF EXISTS t_02833;

CREATE TABLE t_02833
(
    tup Tuple(a UInt64, b UInt64)
)
ENGINE = Log;

INSERT INTO t_02833;

SYSTEM DROP  TABLE t_02833;