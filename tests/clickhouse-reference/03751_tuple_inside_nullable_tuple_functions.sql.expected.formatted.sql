SELECT
    CAST(tuple(1, 'a') AS Nullable(Tuple(Int32, String))) AS t,
    toTypeName(t),
    isNull(t);

SELECT
    tuple(CAST((1, 'a') AS Nullable(Tuple(Int32, String)))) AS outer_t,
    toTypeName(outer_t);

SELECT
    tupleConcat(CAST((1, 2) AS Nullable(Tuple(Int32, Int32))), CAST(tuple(3) AS Nullable(Tuple(Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleConcat(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST(tuple(3) AS Nullable(Tuple(Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleDivide(CAST((10, 20) AS Nullable(Tuple(Int32, Int32))), CAST((2, 4) AS Nullable(Tuple(Int32, Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleDivide(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((2, 4) AS Nullable(Tuple(Int32, Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleDivideByNumber(CAST((10, 20) AS Nullable(Tuple(Int32, Int32))), 2) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleDivideByNumber(CAST(NULL AS Nullable(Tuple(Int32, Int32))), 2) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    CAST((1, 'a') AS Nullable(Tuple(Int32, String))).2 AS v,
    toTypeName(v),
    isNull(v);

SELECT
    CAST(NULL AS Nullable(Tuple(Int32, String))).2 AS v_null,
    toTypeName(v_null),
    isNull(v_null);

SELECT
    tupleElement(CAST(tuple(1 AS id, 'a' AS name) AS Nullable(Tuple(id Int32, name String))), 'name') AS v_name,
    toTypeName(v_name),
    isNull(v_name);

SELECT
    t.2 AS v,
    toTypeName(v),
    isNull(v)
FROM (
        SELECT CAST((1, 'a') AS Nullable(Tuple(Int32, String))) AS t
    );

SELECT
    tupleHammingDistance(CAST((1, 2, 3) AS Nullable(Tuple(Int32, Int32, Int32))), CAST((1, 2, 4) AS Nullable(Tuple(Int32, Int32, Int32)))) AS d,
    toTypeName(d),
    isNull(d);

SELECT
    tupleHammingDistance(CAST(NULL AS Nullable(Tuple(Int32, Int32, Int32))), CAST((1, 2, 4) AS Nullable(Tuple(Int32, Int32, Int32)))) AS d_null,
    toTypeName(d_null),
    isNull(d_null);

SELECT
    tupleIntDiv(CAST((10, 9) AS Nullable(Tuple(Int32, Int32))), CAST((3, 2) AS Nullable(Tuple(Int32, Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleIntDiv(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((3, 2) AS Nullable(Tuple(Int32, Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleIntDivByNumber(CAST((10, 9) AS Nullable(Tuple(Int32, Int32))), 3) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleIntDivByNumber(CAST(NULL AS Nullable(Tuple(Int32, Int32))), 3) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleIntDivOrZero(CAST((10, 9) AS Nullable(Tuple(Int32, Int32))), CAST((2, 0) AS Nullable(Tuple(Int32, Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleIntDivOrZero(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((2, 3) AS Nullable(Tuple(Int32, Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleIntDivOrZeroByNumber(CAST((10, 9) AS Nullable(Tuple(Int32, Int32))), 3) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleIntDivOrZeroByNumber(CAST((10, 9) AS Nullable(Tuple(Int32, Int32))), 0) AS res_zero,
    toTypeName(res_zero),
    isNull(res_zero);

SELECT
    tupleIntDivOrZeroByNumber(CAST(NULL AS Nullable(Tuple(Int32, Int32))), 3) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleMinus(CAST((5, 4) AS Nullable(Tuple(Int32, Int32))), CAST((2, 1) AS Nullable(Tuple(Int32, Int32)))) AS diff,
    toTypeName(diff),
    isNull(diff);

SELECT
    tupleMinus(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((2, 1) AS Nullable(Tuple(Int32, Int32)))) AS diff_null,
    toTypeName(diff_null),
    isNull(diff_null);

SELECT
    tupleModulo(CAST((15, 10, 5) AS Nullable(Tuple(Int32, Int32, Int32))), CAST((5, 3, 2) AS Nullable(Tuple(Int32, Int32, Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleModulo(CAST(NULL AS Nullable(Tuple(Int32, Int32, Int32))), CAST((5, 3, 2) AS Nullable(Tuple(Int32, Int32, Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleModuloByNumber(CAST((15, 10, 5) AS Nullable(Tuple(Int32, Int32, Int32))), 2) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleModuloByNumber(CAST(NULL AS Nullable(Tuple(Int32, Int32, Int32))), 2) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tupleMultiply(CAST((1, 2) AS Nullable(Tuple(Int32, Int32))), CAST((2, 3) AS Nullable(Tuple(Int32, Int32)))) AS prod,
    toTypeName(prod),
    isNull(prod);

SELECT
    tupleMultiply(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((2, 3) AS Nullable(Tuple(Int32, Int32)))) AS prod_null,
    toTypeName(prod_null),
    isNull(prod_null);

SELECT
    tupleMultiplyByNumber(CAST((1, 2) AS Nullable(Tuple(Int32, Int32))), -2.1) AS prod,
    toTypeName(prod),
    isNull(prod);

SELECT
    tupleMultiplyByNumber(CAST(NULL AS Nullable(Tuple(Int32, Int32))), -2.1) AS prod_null,
    toTypeName(prod_null),
    isNull(prod_null);

SELECT
    tupleNegate(CAST((1, -2) AS Nullable(Tuple(Int32, Int32)))) AS res,
    toTypeName(res),
    isNull(res);

SELECT
    tupleNegate(CAST(NULL AS Nullable(Tuple(Int32, Int32)))) AS res_null,
    toTypeName(res_null),
    isNull(res_null);

SELECT
    tuplePlus(CAST((1, 2) AS Nullable(Tuple(Int32, Int32))), CAST((10, 20) AS Nullable(Tuple(Int32, Int32)))) AS sum_nn,
    toTypeName(sum_nn),
    isNull(sum_nn);

SELECT
    tuplePlus(CAST(NULL AS Nullable(Tuple(Int32, Int32))), CAST((10, 20) AS Nullable(Tuple(Int32, Int32)))) AS sum_null,
    toTypeName(sum_null),
    isNull(sum_null);