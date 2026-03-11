SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY ALL;

SELECT
    id,
    category,
    count(*) AS cnt
FROM test_limit_by_all
GROUP BY
    id,
    category
ORDER BY
    id ASC,
    category ASC
LIMIT 1 BY ALL;

SELECT
    id,
    category,
    concat(category, '_', name) AS combined
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 2 BY ALL;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY id, category, value;

SELECT
    id,
    category,
    value,
    row_number() OVER (PARTITION BY category ORDER BY value ASC) AS rn
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC,
    rn ASC
LIMIT 1 BY ALL
LIMIT 3;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
WHERE value > 200
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY ALL;

SELECT
    id AS k,
    category
FROM test_limit_by_all
ORDER BY
    k ASC,
    category ASC,
    value ASC
LIMIT 1 BY ALL;

SELECT *
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC,
    name ASC
LIMIT 1 BY ALL;

SELECT id
FROM (
        SELECT DISTINCT
            id,
            category
        FROM test_limit_by_all
    )
ORDER BY
    id ASC,
    category ASC
LIMIT 1 BY ALL;

SELECT DISTINCT
    id,
    category
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC
LIMIT 1 BY ALL
LIMIT 2;

SELECT
    d,
    category,
    count() AS c
FROM (
        WITH toStartOfDay(toDateTime('2025-01-01 12:00:00')) AS d

        SELECT
            d,
            category
        FROM test_limit_by_all
        ORDER BY
            d ASC,
            category ASC,
            value ASC,
            name ASC
        LIMIT 2 BY ALL
        SETTINGS enable_positional_arguments = 0
    )
GROUP BY
    d,
    category
ORDER BY
    d ASC,
    category ASC;

SELECT
    id,
    category
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY ALL;

SELECT
    id,
    category
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY ALL;

SELECT
    id,
    category
FROM test_limit_by_all
ORDER BY value DESC
LIMIT 1 BY ALL
LIMIT 2;

SELECT count()
FROM test_limit_by_all
LIMIT 1 BY ALL;

SELECT
    t.id,
    tag
FROM
    test_limit_by_all AS t
LEFT JOIN test_limit_by_all_tags AS g
    USING (id)
ARRAY JOIN g.tags AS tag
ORDER BY
    t.id ASC,
    tag ASC,
    value ASC
LIMIT 1 BY ALL;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY id;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY id;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT -2;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT -2
OFFSET -1;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT -1 BY id;

SELECT
    id,
    category,
    value
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 0 BY ALL;

SELECT
    id,
    count() AS c
FROM test_limit_by_all
GROUP BY
    id,
    category
HAVING c >= 1
ORDER BY
    id ASC,
    c DESC,
    category ASC
LIMIT 1 BY ALL;

SELECT
    id,
    category
FROM test_limit_by_all
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY ALL;