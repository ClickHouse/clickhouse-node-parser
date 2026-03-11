SELECT toTypeName(arrayElementOrNull([(1, 'a'), (2, 'b')], 1));

SELECT toTypeName(arrayElementOrNull(CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))), 1));

SELECT toTypeName(arrayElementOrNull(CAST([(NULL, 'a'), (1, 'b')] AS Array(Tuple(Nullable(Int64), String))), 1));

SELECT toTypeName(arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Tuple())), 1));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], 1);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], 2);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], 3);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], -1);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], -2);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], -3);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], 0);

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(1 AS Int8));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(-1 AS Int8));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(2 AS UInt8));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(-2 AS Int16));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(1 AS Int16));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(2 AS UInt16));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(-2 AS Int32));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(1 AS Int32));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(2 AS UInt32));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(-2 AS Int64));

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], CAST(1 AS Int64));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], 1);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], 2);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], 3);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], -1);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], -2);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], -3);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], 0);

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(1 AS Int8));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(-1 AS Int8));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(2 AS UInt8));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(-2 AS Int16));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(1 AS Int16));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(2 AS UInt16));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(-2 AS Int32));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(1 AS Int32));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(2 AS UInt32));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(-2 AS Int64));

SELECT arrayElementOrNull([CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')], CAST(1 AS Int64));

SELECT
    arrayElementOrNull(arr, 1),
    arrayElementOrNull(arr, -1),
    arrayElementOrNull(arr, 3),
    arrayElementOrNull(arr, 0),
    arrayElementOrNull(arr, CAST(1 AS Int8)),
    arrayElementOrNull(arr, CAST(-1 AS Int8)),
    arrayElementOrNull(arr, CAST(2 AS UInt8)),
    arrayElementOrNull(arr, CAST(-2 AS Int16)),
    arrayElementOrNull(arr, CAST(1 AS Int16)),
    arrayElementOrNull(arr, CAST(2 AS UInt16)),
    arrayElementOrNull(arr, CAST(-2 AS Int32)),
    arrayElementOrNull(arr, CAST(1 AS Int32)),
    arrayElementOrNull(arr, CAST(2 AS UInt32)),
    arrayElementOrNull(arr, CAST(-2 AS Int64)),
    arrayElementOrNull(arr, CAST(1 AS Int64)),
    arrayElementOrNull(arr, CAST(-1 AS Int64)),
    arrayElementOrNull(arr, CAST(1 AS Int64))
FROM (
        SELECT [(1, 'a'), (2, 'b')] AS arr
        UNION ALL
        SELECT [(3, 'c')] AS arr
        UNION ALL
        SELECT [] AS arr
    )
ORDER BY tuple() ASC;

SELECT
    arrayElementOrNull(arr, 1),
    arrayElementOrNull(arr, -1),
    arrayElementOrNull(arr, 3),
    arrayElementOrNull(arr, 0),
    arrayElementOrNull(arr, CAST(1 AS Int8)),
    arrayElementOrNull(arr, CAST(-1 AS Int8)),
    arrayElementOrNull(arr, CAST(2 AS UInt8)),
    arrayElementOrNull(arr, CAST(-2 AS Int16)),
    arrayElementOrNull(arr, CAST(1 AS Int16)),
    arrayElementOrNull(arr, CAST(2 AS UInt16)),
    arrayElementOrNull(arr, CAST(-2 AS Int32)),
    arrayElementOrNull(arr, CAST(1 AS Int32)),
    arrayElementOrNull(arr, CAST(2 AS UInt32)),
    arrayElementOrNull(arr, CAST(-2 AS Int64)),
    arrayElementOrNull(arr, CAST(1 AS Int64)),
    arrayElementOrNull(arr, CAST(-1 AS Int64)),
    arrayElementOrNull(arr, CAST(1 AS Int64))
FROM (
        SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')] AS arr
        UNION ALL
        SELECT [CAST((3, 'c') AS Nullable(Tuple(Int64, String)))] AS arr
        UNION ALL
        SELECT [NULL] AS arr
    )
ORDER BY tuple() ASC;

SELECT arrayElementOrNull(arr, idx)
FROM (
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            2 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            3 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -2 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -3 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            0 AS idx
    )
ORDER BY tuple() ASC;

SELECT
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Tuple())), 1) AS idx1,
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Tuple())), 2) AS idx2,
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Tuple())), 3) AS idx3,
    toTypeName(arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Tuple())), 1)) AS type1;

SELECT
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))), 1) AS idx1,
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))), 2) AS idx2,
    arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))), 3) AS idx3,
    toTypeName(arrayElementOrNull(CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))), 1)) AS type1;

SELECT arrayElementOrNull(arr, idx)
FROM (
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([(2, 'b')] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            2 AS idx
        UNION ALL
        SELECT
            CAST([(3, 'c')] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
    )
ORDER BY tuple() ASC;

SELECT arrayElementOrNull(arr, idx)
FROM (
        SELECT
            CAST([tuple(), tuple()] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple()] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple(), tuple()] AS Array(Tuple())) AS arr,
            3 AS idx
    )
ORDER BY tuple() ASC;

SELECT arrayElementOrNull(arr, idx)
FROM (
        SELECT
            CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple()] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([NULL] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))) AS arr,
            3 AS idx
    )
ORDER BY tuple() ASC;

SELECT arrayElementOrNull([(1, 'a'), (2, 'b')], 'x');

SELECT
    id,
    arrayElementOrNull(arr, 1) AS arr_1,
    arrayElementOrNull(arr, -1) AS arr_minus_1,
    arrayElementOrNull(arr, 3) AS arr_3,
    arrayElementOrNull(arr_null, 1) AS arr_null_1,
    arrayElementOrNull(arr_null, 2) AS arr_null_2,
    arrayElementOrNull(arr_null, 3) AS arr_null_3
FROM test_array_tuple_mergetree
ORDER BY id ASC;

SELECT
    id,
    idx,
    arrayElementOrNull(arr, idx) AS arr_idx,
    arrayElementOrNull(arr_null, idx) AS arr_null_idx
FROM test_array_tuple_mergetree
ORDER BY id ASC;

SELECT toTypeName([(1, 'a'), (2, 'b')][1]);

SELECT toTypeName(CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String))))[1]);

SELECT toTypeName(CAST([(NULL, 'a'), (1, 'b')] AS Array(Tuple(Nullable(Int64), String)))[1]);

SELECT toTypeName(CAST([tuple(), tuple()] AS Array(Tuple()))[1]);

SELECT [(1, 'a'), (2, 'b')][1];

SELECT [(1, 'a'), (2, 'b')][2];

SELECT [(1, 'a'), (2, 'b')][3];

SELECT [(1, 'a'), (2, 'b')][-1];

SELECT [(1, 'a'), (2, 'b')][-2];

SELECT [(1, 'a'), (2, 'b')][-3];

SELECT [(1, 'a'), (2, 'b')][0];

SELECT [(1, 'a'), (2, 'b')][CAST(1 AS Int8)];

SELECT [(1, 'a'), (2, 'b')][CAST(-1 AS Int8)];

SELECT [(1, 'a'), (2, 'b')][CAST(2 AS UInt8)];

SELECT [(1, 'a'), (2, 'b')][CAST(-2 AS Int16)];

SELECT [(1, 'a'), (2, 'b')][CAST(1 AS Int16)];

SELECT [(1, 'a'), (2, 'b')][CAST(2 AS UInt16)];

SELECT [(1, 'a'), (2, 'b')][CAST(-2 AS Int32)];

SELECT [(1, 'a'), (2, 'b')][CAST(1 AS Int32)];

SELECT [(1, 'a'), (2, 'b')][CAST(2 AS UInt32)];

SELECT [(1, 'a'), (2, 'b')][CAST(-2 AS Int64)];

SELECT [(1, 'a'), (2, 'b')][CAST(1 AS Int64)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][1];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][2];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][3];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][-1];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][-2];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][-3];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][0];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(1 AS Int8)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(-1 AS Int8)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(2 AS UInt8)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(-2 AS Int16)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(1 AS Int16)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(2 AS UInt16)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(-2 AS Int32)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(1 AS Int32)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(2 AS UInt32)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(-2 AS Int64)];

SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')][CAST(1 AS Int64)];

SELECT
    arr[1],
    arr[-1],
    arr[3],
    arr[CAST(1 AS Int8)],
    arr[CAST(-1 AS Int8)],
    arr[CAST(2 AS UInt8)],
    arr[CAST(-2 AS Int16)],
    arr[CAST(1 AS Int16)],
    arr[CAST(2 AS UInt16)],
    arr[CAST(-2 AS Int32)],
    arr[CAST(1 AS Int32)],
    arr[CAST(2 AS UInt32)],
    arr[CAST(-2 AS Int64)],
    arr[CAST(1 AS Int64)],
    arr[CAST(-1 AS Int64)],
    arr[CAST(1 AS Int64)]
FROM (
        SELECT [(1, 'a'), (2, 'b')] AS arr
        UNION ALL
        SELECT [(3, 'c')] AS arr
        UNION ALL
        SELECT [] AS arr
    )
ORDER BY tuple() ASC;

SELECT
    arr[0],
    arr[-1]
FROM (
        SELECT [(1, 'a'), (2, 'b')] AS arr
        UNION ALL
        SELECT [(3, 'c')] AS arr
        UNION ALL
        SELECT [] AS arr
    );

SELECT
    arr[0],
    arr[-1]
FROM (
        SELECT [(1, 'a'), (2, 'b')] AS arr
        UNION ALL
        SELECT [(3, 'c')] AS arr
        UNION ALL
        SELECT [NULL] AS arr
    );

SELECT
    arr[1],
    arr[-1],
    arr[3],
    arr[CAST(1 AS Int8)],
    arr[CAST(-1 AS Int8)],
    arr[CAST(2 AS UInt8)],
    arr[CAST(-2 AS Int16)],
    arr[CAST(1 AS Int16)],
    arr[CAST(2 AS UInt16)],
    arr[CAST(-2 AS Int32)],
    arr[CAST(1 AS Int32)],
    arr[CAST(2 AS UInt32)],
    arr[CAST(-2 AS Int64)],
    arr[CAST(1 AS Int64)],
    arr[CAST(-1 AS Int64)],
    arr[CAST(1 AS Int64)]
FROM (
        SELECT [CAST((1, 'a') AS Nullable(Tuple(Int64, String))), (2, 'b')] AS arr
        UNION ALL
        SELECT [CAST((3, 'c') AS Nullable(Tuple(Int64, String)))] AS arr
        UNION ALL
        SELECT [NULL] AS arr
    )
ORDER BY tuple() ASC;

SELECT arr[idx]
FROM (
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            2 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            3 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -2 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -3 AS idx
        UNION ALL
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            0 AS idx
    )
ORDER BY tuple() ASC;

SELECT
    CAST([tuple(), tuple()] AS Array(Tuple()))[1] AS idx1,
    CAST([tuple(), tuple()] AS Array(Tuple()))[2] AS idx2,
    CAST([tuple(), tuple()] AS Array(Tuple()))[3] AS idx3,
    toTypeName(CAST([tuple(), tuple()] AS Array(Tuple()))[1]) AS type1;

SELECT
    CAST([tuple(), tuple()] AS Array(Nullable(Tuple())))[1] AS idx1,
    CAST([tuple(), tuple()] AS Array(Nullable(Tuple())))[2] AS idx2,
    CAST([tuple(), tuple()] AS Array(Nullable(Tuple())))[3] AS idx3,
    toTypeName(CAST([tuple(), tuple()] AS Array(Nullable(Tuple())))[1]) AS type1;

SELECT arr[idx]
FROM (
        SELECT
            CAST([(1, 'a'), NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([NULL] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([(2, 'b')] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            2 AS idx
        UNION ALL
        SELECT
            CAST([(3, 'c')] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple(Int64, String)))) AS arr,
            -1 AS idx
    )
ORDER BY tuple() ASC;

SELECT arr[idx]
FROM (
        SELECT
            CAST([tuple(), tuple()] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple()] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Tuple())) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple(), tuple()] AS Array(Tuple())) AS arr,
            3 AS idx
    )
ORDER BY tuple() ASC;

SELECT arr[idx]
FROM (
        SELECT
            CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple()] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([NULL] AS Array(Nullable(Tuple()))) AS arr,
            1 AS idx
        UNION ALL
        SELECT
            CAST([tuple(), tuple()] AS Array(Nullable(Tuple()))) AS arr,
            3 AS idx
    )
ORDER BY tuple() ASC;

SELECT [(1, 'a'), (2, 'b')]['x'];

SELECT
    id,
    arr[1] AS arr_1,
    arr[-1] AS arr_minus_1,
    arr[3] AS arr_3,
    arr_null[1] AS arr_null_1,
    arr_null[2] AS arr_null_2,
    arr_null[3] AS arr_null_3
FROM test_array_tuple_mergetree
ORDER BY id ASC;

SELECT
    id,
    idx,
    arr[idx] AS arr_idx,
    arr_null[idx] AS arr_null_idx
FROM test_array_tuple_mergetree
ORDER BY id ASC;

SELECT [(1, 2)][NULL];

SELECT arrayElementOrNull([(1, 2)], NULL);

SELECT arrayElementOrNull([CAST(NULL AS Nullable(Tuple()))], NULL);