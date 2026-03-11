SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([0, 0, 1, 1] AS Array(Int8)));

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([-1, -1, 1, 1] AS Array(Int8)));

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = 0, 'true' = 1))));

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = -1, 'true' = 1))));

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt8)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt16)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt32)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt64)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int8)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int16)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int32)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int64)), [0, 0, 1, 1]);

SELECT arrayROCAUC(CAST([-0.1, -0.4, -0.35, -0.8] AS Array(Float32)), [0, 0, 1, 1]);

SELECT arrayROCAUC([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([0, 0, 1, 1] AS Array(Int8)), true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([-1, -1, 1, 1] AS Array(Int8)), true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = 0, 'true' = 1))), true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = -1, 'true' = 1))), true);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt8)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt16)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt32)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt64)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int8)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int16)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int32)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int64)), [0, 0, 1, 1], true);

SELECT arrayROCAUC(CAST([-0.1, -0.4, -0.35, -0.8] AS Array(Float32)), [0, 0, 1, 1], true);

SELECT arrayROCAUC([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0], true);

SELECT arrayROCAUC([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0], true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], false);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([0, 0, 1, 1] AS Array(Int8)), false);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([-1, -1, 1, 1] AS Array(Int8)), false);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = 0, 'true' = 1))), false);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = -1, 'true' = 1))), false);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt8)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt16)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt32)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt64)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int8)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int16)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int32)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int64)), [0, 0, 1, 1], false);

SELECT arrayROCAUC(CAST([-0.1, -0.4, -0.35, -0.8] AS Array(Float32)), [0, 0, 1, 1], false);

SELECT arrayROCAUC([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0], false);

SELECT arrayROCAUC([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0], false);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([0, 0, 1, 1] AS Array(Int8)), true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST([-1, -1, 1, 1] AS Array(Int8)), true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = 0, 'true' = 1))), true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], CAST(['false', 'false', 'true', 'true'] AS Array(Enum8('false' = -1, 'true' = 1))), true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt8)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt16)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt32)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([10, 40, 35, 80] AS Array(UInt64)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int8)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int16)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int32)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([-10, -40, -35, -80] AS Array(Int64)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC(CAST([-0.1, -0.4, -0.35, -0.8] AS Array(Float32)), [0, 0, 1, 1], true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0, 3, 5, 6, 7.5, 8], [1, 0, 1, 0, 0, 0], true, [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.35, 0.4, 0.8], [1, 0, 1, 0], true, [0, 0, 0, 0]);

SELECT arrayAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], false);

SELECT arrayROCAUC([0, 0, 1, 1]);

SELECT arrayROCAUC([0.1, 0.35], [0, 0, 1, 1]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], materialize(true));

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], [0, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, [0, 0, 0, 0], true);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, [0, 0, 0, NULL]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, ['a', 'b', 'c', 'd']);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, [0, 1, 0, 0, 0]);

SELECT arrayROCAUC([0.1, 0.4, 0.35, 0.8], [0, 0, 1, 1], true, [-1, 0, 0, 0]);

SELECT arrayROCAUC(x, y, true, z)
FROM (
        SELECT
            [1] AS x,
            [0] AS y,
            [0, 0, 0, 0, 0, 0, 0, 0] AS z
        UNION ALL
        SELECT
            [1] AS x,
            [0] AS y,
            [] AS z
    );

SELECT arrayROCAUC(x, y, true, z)
FROM (
        SELECT
            [1] AS x,
            [0] AS y,
            [0, 0, 0] AS z
        UNION ALL
        SELECT
            [1] AS x,
            [1] AS y,
            [0, 0, 0, 0, 0] AS z
    );