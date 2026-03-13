SELECT
    color_id,
    payload
FROM t
WHERE dictGetString('colors', 'name', color_id) = 'red'
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE 'red' = dictGetString('colors', 'name', color_id)
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE dictGetUInt64('colors', 'n', color_id) < 10
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE 10 > dictGetUInt64('colors', 'n', color_id)
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE dictGetInt32('colors', 'n', color_id) >= 2
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE like(dictGetString('colors', 'name', color_id), 'r%')
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE ilike(dictGetString('colors', 'name', color_id), 'r%')
ORDER BY
    color_id ASC,
    payload ASC;

SELECT color_id
FROM t
WHERE equals(dictGetString('colors', 'name', color_id), 'red')
ORDER BY color_id ASC;

SELECT
    color_id,
    payload
FROM t
WHERE dictGetString('colors', 'name', color_id) != 'red'
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE notLike(dictGetString('colors', 'name', color_id), 'r%')
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE notILike(dictGetString('colors', 'name', color_id), 'r%')
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE match(dictGetString('colors', 'name', color_id), '^r')
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE NOT dictGetString('colors', 'name', color_id) = 'red'
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE (dictGetString('colors', 'name', color_id) = 'red'
    AND dictGetUInt64('colors', 'n', color_id) < 10)
    OR dictGetString('colors', 'name', color_id) = 'green'
ORDER BY
    color_id ASC,
    payload ASC;

SELECT
    color_id,
    payload
FROM t
WHERE dictGetString('colors', 'name', color_id) = NULL
ORDER BY
    color_id ASC,
    payload ASC;

SELECT color_id
FROM t
PREWHERE dictGetString('colors', 'name', color_id) = 'red'
ORDER BY color_id ASC;

SELECT
    color_id,
    row_number() OVER (PARTITION BY 1 ORDER BY color_id ASC) AS rn
FROM t
ORDER BY
    color_id ASC,
    rn ASC
QUALIFY dictGetString('colors', 'name', color_id) = 'red';

SELECT color_id
FROM t
WHERE dictGetString('colors', 'name', color_id) = 'nonexistent_color'
ORDER BY color_id ASC;

SELECT
    color_id,
    count() AS c
FROM t
GROUP BY color_id
HAVING dictGetString('colors', 'name', color_id) = 'red'
ORDER BY
    color_id ASC,
    c ASC;

SELECT
    t1.color_id,
    t1.payload,
    t2.payload AS payload2
FROM
    t AS t1
INNER JOIN t AS t2
    ON t1.color_id = t2.color_id
    AND dictGetString('colors', 'name', t1.color_id) = 'red'
ORDER BY
    t1.color_id ASC,
    t1.payload ASC,
    payload2 ASC;

SELECT
    t1.color_id,
    t1.payload,
    t2.payload AS payload2
FROM
    t AS t1
LEFT JOIN t AS t2
    ON t1.color_id = t2.color_id
    AND dictGetString('colors', 'name', t1.color_id) = 'red'
ORDER BY
    t1.color_id ASC,
    t1.payload ASC,
    payload2 ASC;

SELECT
    color_id,
    payload,
    multiIf(dictGetString('colors', 'name', color_id) = 'red', 'match', 'no_match') AS tag
FROM t
ORDER BY
    color_id ASC,
    payload ASC,
    tag ASC;

SELECT countIf(dictGetString('colors', 'name', color_id) = 'red') AS cnt
FROM t;

SELECT sumIf(color_id, dictGetString('colors', 'name', color_id) = 'red') AS sum_id_match
FROM t;

SELECT
    color_id,
    payload
FROM t
ORDER BY
    (dictGetString('colors', 'name', color_id) = 'red') DESC,
    color_id ASC,
    payload ASC;

SELECT
    (dictGetString('colors', 'name', color_id) = 'red') AS is_red,
    count() AS c
FROM t
GROUP BY (dictGetString('colors', 'name', color_id) = 'red')
ORDER BY
    is_red ASC,
    c ASC;

SELECT
    color_id,
    payload
FROM t
ORDER BY
    color_id ASC,
    payload ASC
LIMIT 1 BY (dictGetString('colors', 'name', color_id) = 'red');

SELECT
    color_id,
    row_number() OVER (PARTITION BY (dictGetString('colors', 'name', color_id) = 'red') ORDER BY color_id ASC) AS rn
FROM t
ORDER BY
    color_id ASC,
    rn ASC;

SELECT color_id
FROM t
WHERE dictGetString('colors', 'name', color_id) = payload
ORDER BY color_id ASC;

SELECT
    *,
    dictGetUInt16('dict', 'c0', t1.c0) = true
FROM dict AS t1; -- { serverError BAD_ARGUMENTS }

SELECT equals(materialize(9), CAST('red' AS Nullable(String)) = dictGetString('colors', 'payload', color_id))
FROM t__fuzz_0;

SELECT DISTINCT
    13,
    *,
    or(-32 = dictGetInt32(toFixedString('dictionary_all', toLowCardinality(14)), toFixedString('i32', 3), id), isNotDistinctFrom(1, 9223372036854775806), toLowCardinality(19), NOT equals(payload, 9223372036854775806)),
    isNotNull('dictGetFloat64 - plan'),
    id,
    isNotNull(1)
FROM tab__fuzz_24
PREWHERE equals(9223372036854775806, payload)
WHERE isNotDistinctFrom(id, isNotDistinctFrom(9223372036854775806, equals(1, isNotNull(9223372036854775806))))
ORDER BY payload DESC
QUALIFY and(NULL, equals(1, isZeroOrNull(1)));