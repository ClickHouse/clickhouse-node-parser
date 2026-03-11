SELECT CAST(tuple(NULL, NULL), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))')
GROUP BY
    1,
    tuple(1, NULL);

SELECT
    tuple(tuple(materialize(NULL)), 42, CAST(tuple(NULL, NULL), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'), toNullable(NULL)),
    (NULL, NULL) IN (CAST(tuple(NULL, 1), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'))
GROUP BY
    1,
    isZeroOrNull(assumeNotNull(materialize(NULL))),
    tuple(1, NULL),
    (NULL, NULL) GLOBAL IN (CAST(tuple(NULL, NULL), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'))
SETTINGS
    transform_null_in = 0,
    enable_analyzer = 1;

SELECT
    tuple(tuple(materialize(NULL)), 42, CAST(tuple(NULL, NULL), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'), toNullable(NULL)),
    (NULL, NULL) IN (CAST(tuple(NULL, 1), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'))
GROUP BY
    1,
    isZeroOrNull(assumeNotNull(materialize(NULL))),
    tuple(1, NULL),
    (NULL, NULL) GLOBAL IN (CAST(tuple(NULL, NULL), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'))
SETTINGS
    transform_null_in = 0,
    enable_analyzer = 0;

SELECT count()
FROM (
        SELECT
            number % 3 AS a,
            number % 5 AS b
        FROM numbers(100)
    )
GROUP BY
    CAST(tuple(a, b), 'Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))'),
    tuple(1, NULL)
ORDER BY 1 ASC;

SELECT CAST(tuple(NULL, tuple(NULL, NULL)), 'Nullable(Tuple(Nullable(UInt32), Nullable(Tuple(Nullable(UInt32), Nullable(UInt32)))))')
GROUP BY 1;

SELECT
    t,
    count()
FROM (
        SELECT CAST(if(number % 2 = 0, tuple(number, number * 2), NULL), 'Nullable(Tuple(Nullable(UInt64), Nullable(UInt64)))') AS t
        FROM numbers(10)
    )
GROUP BY t
ORDER BY t ASC;