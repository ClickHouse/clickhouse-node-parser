SELECT
    (
        SELECT arrayFilter(x -> (x = a), [1])
        FROM (
                SELECT 1 AS a
            )
    ),
    (
        SELECT arrayFilter(x -> (x = a), [1])
        FROM (
                SELECT CAST(NULL AS Nullable(UInt8)) AS a
            )
    );

SELECT
    (
        SELECT arrayFilter(x -> (x = a), [1])
        FROM (
                SELECT CAST(NULL AS Nullable(UInt8)) AS a
            )
    ),
    (
        SELECT arrayFilter(x -> (x = a), [1])
        FROM (
                SELECT 1 AS a
            )
    );

SELECT arrayFilter(x -> (_CAST(1, 'Nullable(UInt8)') = x), _CAST([1], 'Array(UInt8)'));

SELECT arrayFilter(x -> (_CAST(1, 'Nullable(UInt8)') = x), [1, 2, 3]);

SELECT arrayFilter(x -> (x = _CAST(1, 'Nullable(UInt8)')), [1, 2, 3]);

SELECT arrayFilter(x -> (NULL = x), [1, 2, 3]);

SELECT arrayFilter(x -> (x = NULL), [1, 2, 3]);

SELECT arrayFilter(x -> (x = n), [1, 2, 3])
FROM (
        SELECT CAST(1 AS Nullable(UInt8)) AS n
    );

SELECT toTypeName(arrayFilter(x -> (x = 1), [1, 2, 3]));

SELECT toTypeName(arrayFilter(x -> (x = _CAST(1, 'Nullable(UInt8)')), [1, 2, 3]));