SELECT untuple(x)
FROM test_empty
SETTINGS enable_analyzer = 1;

SELECT untuple(CAST(tuple() AS Nullable(Tuple())))
SETTINGS enable_analyzer = 1;

SELECT untuple(x)
FROM test_untuple_nullable_tuple
ORDER BY
    isNull(x) ASC,
    x ASC;

SELECT untuple(CAST((1, 'a') AS Nullable(Tuple(Int32, String))));

SELECT untuple(CAST(NULL AS Nullable(Tuple(Int32, String))));

SELECT untuple(CAST(NULL AS Nullable(Tuple(Array(Int32), String))));