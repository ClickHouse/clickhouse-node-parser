-- type correctness tests
SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], CAST([0, 0, 1, 1] AS Array(Int8))), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], CAST([-1, -1, 1, 1] AS Array(Int8))), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = 0, 'true' = 1)))), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = -1, 'true' = 1)))), 10);

SELECT floor(arrayAUCPR(CAST([10, 40, 35, 80] AS Array(UInt8)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([10, 40, 35, 80] AS Array(UInt16)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([10, 40, 35, 80] AS Array(UInt32)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([10, 40, 35, 80] AS Array(UInt64)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([-10, -40, -35, -80] AS Array(Int8)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([-10, -40, -35, -80] AS Array(Int16)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([-10, -40, -35, -80] AS Array(Int32)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([-10, -40, -35, -80] AS Array(Int64)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR(CAST([-0.1, -0.4, -0.35, -0.8] AS Array(Float32)), [0, 0, 1, 1]), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.4, 0.35, 0.8], [0, 0, 1, 1, 1]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.4, 0.8], [1, 0, 1, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1]), 10);

SELECT floor(arrayAUCPR([0, 1, 1, 2, 2, 2, 3, 3, 3, 3], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1]), 10);

-- output shouldn't change when passing [0, 0, 0] to the offsets arg
SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.4, 0.35, 0.8], [0, 0, 1, 1, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.4, 0.8], [1, 0, 1, 0, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 1, 1, 2, 2, 2, 3, 3, 3, 3], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1], [0, 0, 0]), 10);

-- edge cases
SELECT floor(arrayAUCPR([1], [1]), 10);

SELECT floor(arrayAUCPR([1], [0]), 10);

SELECT floor(arrayAUCPR([0], [0]), 10);

SELECT floor(arrayAUCPR([0], [1]), 10);

SELECT floor(arrayAUCPR([1, 1], [1, 1]), 10);

SELECT floor(arrayAUCPR([1, 1], [0, 0]), 10);

SELECT floor(arrayAUCPR([1, 1], [0, 1]), 10);

SELECT floor(arrayAUCPR([0, 1], [0, 1]), 10);

SELECT floor(arrayAUCPR([1, 0], [0, 1]), 10);

SELECT floor(arrayAUCPR([0, 0, 1], [0, 1, 1]), 10);

SELECT floor(arrayAUCPR([0, 1, 1], [0, 1, 1]), 10);

SELECT floor(arrayAUCPR([0, 1, 1], [0, 0, 1]), 10);

-- alias
SELECT floor(arrayPRAUC([1], [1]), 10);

-- general negative tests
SELECT arrayAUCPR([], []); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0, 0, 1, 1]); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT arrayAUCPR([0.1, 0.35], [0, 0, 1, 1]); -- { serverError BAD_ARGUMENTS }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], []); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, 0], [1, 1, 0, 1]); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT arrayAUCPR(['a', 'b', 'c', 'd'], [1, 0, 1, 1]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0.1, 0.4, NULL, 0.8], [0, 0, 1, 1]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, NULL, 1, 1]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

-- negative tests for optional argument
SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, NULL]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], ['a', 'b', 'c']); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 1, 0, 0]); -- { serverError BAD_ARGUMENTS }

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, -1, 0]); -- { serverError BAD_ARGUMENTS }

SELECT arrayAUCPR(x, y, z)
FROM (
        SELECT
            [1] AS x,
            [0] AS y,
            [0, 0, 0, 0, 0, 0] AS z
        UNION ALL
        SELECT
            [1] AS x,
            [0] AS y,
            [] AS z
    ); -- { serverError BAD_ARGUMENTS }

SELECT arrayAUCPR(x, y, z)
FROM (
        SELECT
            [1] AS x,
            [0] AS y,
            [0, 0] AS z
        UNION ALL
        SELECT
            [1] AS x,
            [1] AS y,
            [0, 0, 0, 0] AS z
    ); -- { serverError BAD_ARGUMENTS }