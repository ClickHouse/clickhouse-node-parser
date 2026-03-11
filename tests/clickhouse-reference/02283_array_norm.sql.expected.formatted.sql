SELECT L1Norm([1, 2, 3]);

SELECT L2Norm([3., 4., 5.]);

SELECT L2SquaredNorm([3., 4., 5.]);

SELECT LpNorm([3., 4., 5.], 1.1);

SELECT LinfNorm([0, 0, 2]);

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

SELECT L1Norm(1, 2);

SELECT LpNorm([1,2]);

SELECT LpNorm([1,2], -3.4);

SELECT LpNorm([1,2], 'aa');

SELECT LpNorm([1,2], [1]);

SELECT LpNorm([1,2], materialize(3.14));