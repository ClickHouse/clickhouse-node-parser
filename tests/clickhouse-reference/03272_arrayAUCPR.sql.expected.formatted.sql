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

SELECT floor(arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.4, 0.4, 0.35, 0.8], [0, 0, 1, 1, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0.1, 0.35, 0.4, 0.4, 0.8], [1, 0, 1, 0, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1], [0, 0, 0]), 10);

SELECT floor(arrayAUCPR([0, 1, 1, 2, 2, 2, 3, 3, 3, 3], [1, 0, 1, 0, 0, 0, 1, 0, 0, 1], [0, 0, 0]), 10);

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

SELECT floor(arrayPRAUC([1], [1]), 10);

SELECT arrayAUCPR([], []);

SELECT arrayAUCPR([0, 0, 1, 1]);

SELECT arrayAUCPR([0.1, 0.35], [0, 0, 1, 1]);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], []);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, 0], [1, 1, 0, 1]);

SELECT arrayAUCPR(['a', 'b', 'c', 'd'], [1, 0, 1, 1]);

SELECT arrayAUCPR([0.1, 0.4, NULL, 0.8], [0, 0, 1, 1]);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, NULL, 1, 1]);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, NULL]);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], ['a', 'b', 'c']);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 1, 0, 0]);

SELECT arrayAUCPR([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, -1, 0]);

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
    );

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
    );