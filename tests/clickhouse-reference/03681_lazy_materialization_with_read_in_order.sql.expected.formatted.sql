SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            a,
            b,
            c,
            d,
            e
        FROM test_lazy_read_in_order
        WHERE a >= 0
        ORDER BY a ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');

SELECT
    a,
    e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY a ASC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            a,
            b,
            c,
            d,
            e
        FROM test_lazy_read_in_order
        WHERE e > 100
        ORDER BY a ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');

SELECT
    a,
    e
FROM test_lazy_read_in_order
WHERE e > 100
ORDER BY a ASC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            a,
            b,
            c,
            d,
            e
        FROM test_lazy_read_in_order
        PREWHERE e > 100
        ORDER BY a ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');

SELECT
    a,
    e
FROM test_lazy_read_in_order
PREWHERE e > 100
ORDER BY a ASC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            a,
            b,
            c,
            d,
            e
        FROM test_lazy_read_in_order
        WHERE a >= 0
        ORDER BY
            a ASC,
            e ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');

SELECT
    a,
    e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY
    a ASC,
    e ASC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            a,
            b,
            c,
            d,
            e
        FROM test_lazy_read_in_order
        WHERE a >= 0
        ORDER BY
            a ASC,
            a + 1 ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');

SELECT
    a,
    e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY
    a ASC,
    a + 1 ASC
LIMIT 5;

SELECT
    id,
    value,
    score
FROM test_correctness
ORDER BY id ASC
LIMIT 5;

SELECT
    id,
    value,
    score
FROM test_correctness
ORDER BY id DESC
LIMIT 5;

SELECT
    id,
    value,
    score
FROM test_correctness
WHERE score >= 50
ORDER BY id ASC;

SELECT
    id,
    value,
    score
FROM test_correctness
WHERE id >= 0
ORDER BY id ASC
LIMIT 5
SETTINGS
    optimize_read_in_order = 0,
    query_plan_optimize_lazy_materialization = 0;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            id,
            value,
            score,
            data
        FROM test_correctness
        WHERE id >= 0
        ORDER BY id ASC
        LIMIT 5
        SETTINGS max_threads = 1
    )
WHERE like(`explain`, '%LazilyRead%')
    OR like(`explain`, '%Lazily read columns:%')
    OR like(`explain`, '%ReadType:%')
    OR like(`explain`, '%Prefix sort description:%')
    OR like(`explain`, '%Result sort description:%');