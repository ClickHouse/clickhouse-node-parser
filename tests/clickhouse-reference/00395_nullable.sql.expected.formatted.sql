SELECT '----- NULL value -----';

SELECT NULL;

SELECT 1 + NULL;

SELECT abs(NULL);

SELECT NULL + NULL;

SELECT *
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC,
    col3 ASC,
    col4 ASC,
    col5 ASC,
    col6 ASC,
    col7 ASC,
    col8 ASC;

SELECT col1
FROM test1_00395
ORDER BY col1 ASC;

SELECT
    col1,
    col2
FROM test2
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT
    col1,
    col2,
    col1 + col2,
    col1 * 7
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT sum(col1)
FROM test1_00395;

SELECT sum(col1 * 7)
FROM test1_00395;

SELECT
    col1,
    col2,
    isNull(col1),
    isNotNull(col2)
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT
    col1,
    col2,
    ifNull(col1, col2)
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT
    col1,
    col2,
    nullIf(col1, col2)
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT nullIf(1, NULL);

SELECT coalesce(NULL);

SELECT coalesce(NULL, 1);

SELECT coalesce(NULL, NULL, 1);

SELECT coalesce(NULL, 42, NULL, 1);

SELECT coalesce(NULL, NULL, NULL);

SELECT
    col1,
    col2,
    coalesce(col1, col2)
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT
    col1,
    col2,
    coalesce(col1, col2, 99)
FROM test1_00395
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT res
FROM (
        SELECT
            col1,
            assumeNotNull(col1) AS res
        FROM test1_00395
    )
WHERE isNotNull(col1)
ORDER BY res ASC;

SELECT col1
FROM test1_00395
WHERE isNotNull(col1)
ORDER BY col1 ASC;

SELECT col1
FROM test1_00395
WHERE isNull(col1);

SELECT
    col1,
    if(col1 IN ('a', 'b'), 1, 0) AS t,
    toTypeName(t)
FROM test1_00395;

SELECT
    col1,
    if(col1 IN ('a', 'b'), NULL, 0) AS t,
    toTypeName(t)
FROM test1_00395;

SELECT
    col1,
    multiIf(col1 IN ('a', 'b'), 1, 0) AS t,
    toTypeName(t)
FROM test1_00395;

SELECT
    col1,
    multiIf(col1 IN ('a', 'b'), NULL, 0) AS t,
    toTypeName(t)
FROM test1_00395;

SELECT
    col1,
    multiIf(col1 IN ('a', 'b'), 1, NULL) AS t,
    toTypeName(t)
FROM test1_00395;

SELECT multiIf(1, NULL, 1, 3, 4);

SELECT multiIf(1, 2, 1, NULL, 4);

SELECT multiIf(NULL, NULL, NULL);

SELECT multiIf(1, 'A', 1, NULL, 'DEF');

SELECT multiIf(1, toFixedString('A', 16), 1, NULL, toFixedString('DEF', 16));

SELECT multiIf(NULL, 2, 1, 3, 4);

SELECT multiIf(1, 2, NULL, 3, 4);

SELECT multiIf(col1 == 1, col2, col2 == 2, col3, col3 == 3, col1, 42)
FROM test1_00395;

SELECT multiIf(cond1, then1, cond2, then2, then3)
FROM test1_00395;

SELECT [NULL];

SELECT [NULL,NULL,NULL];

SELECT [NULL,2,3];

SELECT [1,NULL,3];

SELECT [1,2,NULL];

SELECT [NULL,'b','c'];

SELECT ['a',NULL,'c'];

SELECT ['a','b',NULL];

SELECT [1,NULL,2,3][1];

SELECT [1,NULL,2,3][2];

SELECT [1,NULL,2,3][3];

SELECT [1,NULL,2,3][4];

SELECT ['a',NULL,'c','d'][1];

SELECT ['a',NULL,'c','d'][2];

SELECT ['a',NULL,'c','d'][3];

SELECT ['a',NULL,'c','d'][4];

SELECT [1,NULL,2,3][col1]
FROM test1_00395;

SELECT col1[1]
FROM test1_00395;

SELECT col1[2]
FROM test1_00395;

SELECT col1[3]
FROM test1_00395;

SELECT col1[4]
FROM test1_00395;

SELECT col1[col2]
FROM test1_00395;

SELECT has([1,NULL,2,3], 1);

SELECT has([1,NULL,2,3], NULL);

SELECT has([1,NULL,2,3], 2);

SELECT has([1,NULL,2,3], 3);

SELECT has([1,NULL,2,3], 4);

SELECT has(['a',NULL,'def','ghij'], 'a');

SELECT has(['a',NULL,'def','ghij'], NULL);

SELECT has(['a',NULL,'def','ghij'], 'def');

SELECT has(['a',NULL,'def','ghij'], 'ghij');

SELECT has([1,NULL,2,3], col1)
FROM test1_00395;

SELECT has(['a',NULL,'def','ghij'], col1)
FROM test1_00395;

SELECT has(col1, 2)
FROM test1_00395;

SELECT has(col1, 3)
FROM test1_00395;

SELECT has(col1, 4)
FROM test1_00395;

SELECT has(col1, 5)
FROM test1_00395;

SELECT has(col1, 7)
FROM test1_00395;

SELECT has(col1, NULL)
FROM test1_00395;

SELECT has(col1, 'a')
FROM test1_00395;

SELECT has(col1, 'bc')
FROM test1_00395;

SELECT has(col1, 'def')
FROM test1_00395;

SELECT has(col1, 'ghij')
FROM test1_00395;

SELECT has(col1, col2)
FROM test1_00395;

SELECT
    col1,
    col2,
    count()
FROM test1_00395
GROUP BY
    col1,
    col2
ORDER BY
    col1 ASC,
    col2 ASC;

SELECT
    col1,
    count()
FROM test1_00395
GROUP BY col1
ORDER BY col1 ASC;

SELECT
    col1,
    col2,
    col3,
    count()
FROM test1_00395
GROUP BY
    col1,
    col2,
    col3
ORDER BY
    col1 ASC,
    col2 ASC,
    col3 ASC;