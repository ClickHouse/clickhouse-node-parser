SELECT *
FROM format(JSONEachRow, '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
');

SELECT *
FROM format(JSONEachRow, (
        SELECT '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
'
    ));

SELECT *
FROM format(JSONEachRow, (
        SELECT '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
'
        WHERE column_does_not_exists = 4
    ));

SELECT count()
FROM format(TSVRaw, (
        SELECT where_qualified__fuzz_19
        FROM numbers(10000)
    ));

SELECT count()
FROM format(TSVRaw, (
        SELECT where_qualified__fuzz_19
        FROM numbers(10000)
        UNION ALL
        SELECT where_qualified__fuzz_35
        FROM numbers(10000)
    ));

SELECT count()
FROM format(TSVRaw, (
        SELECT CAST(arrayStringConcat(groupArray(format(TSVRaw, (
                SELECT CAST(arrayStringConcat(1 GLOBAL IN (
                        SELECT 1
                        WHERE 1 GLOBAL IN (
                                SELECT toUInt128(1)
                                GROUP BY GROUPING SETS ((1))
                            )
                        GROUP BY 1
                        WITH CUBE
                    ), groupArray('some long string')), 'LowCardinality(String)')
                FROM numbers(10000)
            )), toLowCardinality('some long string')), '\n'), 'LowCardinality(String)')
        FROM numbers(10000)
    ))
FORMAT TSVRaw;

SELECT 1
FROM numbers((
        SELECT DEFAULT
    ));