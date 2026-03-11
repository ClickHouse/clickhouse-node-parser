-- Original failing query from the stress test
SELECT 1 FROM t0 FULL JOIN (SELECT 0 AS c0) tx ON t0.c0 = tx.c0
PASTE JOIN (SELECT 0 AS c0, 1 AS c1) ty ORDER BY ty.c0, ty.c1;
-- SELECT * variant to force all columns through the pipeline
SELECT * FROM t0 FULL JOIN (SELECT 0 AS c0) tx ON t0.c0 = tx.c0
PASTE JOIN (SELECT 0 AS c0, 1 AS c1) ty ORDER BY ty.c0, ty.c1;
-- With join_use_nulls (always set in some stress test threads)
SELECT * FROM t0 FULL JOIN (SELECT 0 AS c0) tx ON t0.c0 = tx.c0
PASTE JOIN (SELECT 0 AS c0, 1 AS c1) ty ORDER BY ty.c0, ty.c1
SETTINGS join_use_nulls = 1;
SELECT count(), sum(t0_c0), sum(tx_c0), sum(ty_c0), sum(ty_c1)
FROM (
    SELECT t0.c0 AS t0_c0, tx.c0 AS tx_c0, ty.c0 AS ty_c0, ty.c1 AS ty_c1
    FROM t0 FULL JOIN (SELECT number::UInt8 AS c0 FROM numbers(5)) tx ON t0.c0 = tx.c0
    PASTE JOIN (SELECT number::UInt8 AS c0, (number + 1)::UInt8 AS c1 FROM numbers(20)) ty
    ORDER BY ty.c0, ty.c1
);
-- Without swap for comparison
SELECT count(), sum(t0_c0), sum(tx_c0), sum(ty_c0), sum(ty_c1)
FROM (
    SELECT t0.c0 AS t0_c0, tx.c0 AS tx_c0, ty.c0 AS ty_c0, ty.c1 AS ty_c1
    FROM t0 FULL JOIN (SELECT number::UInt8 AS c0 FROM numbers(5)) tx ON t0.c0 = tx.c0
    PASTE JOIN (SELECT number::UInt8 AS c0, (number + 1)::UInt8 AS c1 FROM numbers(20)) ty
    ORDER BY ty.c0, ty.c1
) SETTINGS query_plan_join_swap_table = 'false';
