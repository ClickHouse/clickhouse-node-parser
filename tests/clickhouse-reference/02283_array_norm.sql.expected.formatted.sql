SELECT L1Norm([1, 2, 3]);

SELECT L2Norm([3., 4., 5.]);

SELECT L2SquaredNorm([3., 4., 5.]);

SELECT LpNorm([3., 4., 5.], 1.1);

SELECT LinfNorm([0, 0, 2]);

SYSTEM DROP  TABLE IF EXISTS vec1;

SYSTEM DROP  TABLE IF EXISTS vec1f;

SYSTEM DROP  TABLE IF EXISTS vec1d;

CREATE TABLE vec1
(
    id UInt64,
    v Array(UInt8)
)
ENGINE = Memory;

CREATE TABLE vec1f
(
    id UInt64,
    v Array(Float32)
)
ENGINE = Memory;

CREATE TABLE vec1d
(
    id UInt64,
    v Array(Float64)
)
ENGINE = Memory;

INSERT INTO vec1;

INSERT INTO vec1f;

INSERT INTO vec1d;

SELECT
    id,
    L1Norm(v),
    L2Norm(v),
    L2SquaredNorm(v),
    LpNorm(v, 2.7),
    LinfNorm(v)
FROM vec1;

SELECT
    id,
    L1Norm(materialize([5., 6.]))
FROM vec1;

SELECT
    id,
    L1Norm(v),
    L2Norm(v),
    L2SquaredNorm(v),
    LpNorm(v, 2.7),
    LinfNorm(v)
FROM vec1f;

SELECT
    id,
    L1Norm(materialize([5., 6.]))
FROM vec1f;

SELECT
    id,
    L1Norm(v),
    L2Norm(v),
    L2SquaredNorm(v),
    LpNorm(v, 2.7),
    LinfNorm(v)
FROM vec1d;

SELECT
    id,
    L1Norm(materialize([5., 6.]))
FROM vec1d;

SELECT L1Norm(1, 2); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT LpNorm([1,2]); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT LpNorm([1,2], -3.4); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT LpNorm([1,2], 'aa'); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT LpNorm([1,2], [1]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT LpNorm([1,2], materialize(3.14)); -- { serverError ILLEGAL_COLUMN }

SYSTEM DROP  TABLE vec1;

SYSTEM DROP  TABLE vec1f;

SYSTEM DROP  TABLE vec1d;