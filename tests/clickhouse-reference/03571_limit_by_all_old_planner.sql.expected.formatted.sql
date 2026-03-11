SELECT
    id,
    category,
    value,
    name
FROM test_limit_by_all_old_planner
LIMIT 1 BY ALL
SETTINGS allow_experimental_analyzer = 0;

SELECT
    id,
    category,
    value
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY id, category, value;

SELECT
    id,
    category,
    concat(category, '_', name) AS combined
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 2 BY id, category, combined;

SELECT
    id,
    category,
    value,
    row_number() OVER (PARTITION BY category ORDER BY value ASC) AS rn
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC,
    rn ASC
LIMIT 1 BY id, category, value, rn
LIMIT 3;

SELECT
    id,
    category,
    value
FROM test_limit_by_all_old_planner
WHERE value > 200
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY id, category, value;

SELECT id
FROM (
        SELECT DISTINCT
            id,
            category
        FROM test_limit_by_all_old_planner
    )
ORDER BY
    id ASC,
    category ASC
LIMIT 1 BY id;

SELECT DISTINCT
    id,
    category
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC
LIMIT 1 BY id, category
LIMIT 2;

SELECT
    id,
    category,
    value
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT -1 BY id;

SELECT
    id,
    category
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY id, category;

SELECT
    id,
    category
FROM test_limit_by_all_old_planner
ORDER BY value DESC
LIMIT 1 BY id, category
LIMIT 2;

SELECT
    id,
    category,
    value
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 0 BY id, category, value;

SELECT
    id,
    category,
    value
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1, 2 BY id;

SELECT
    d,
    category,
    count() AS c
FROM (
        WITH toStartOfDay(toDateTime('2025-01-01 12:00:00')) AS d

        SELECT
            d,
            category
        FROM test_limit_by_all_old_planner
        ORDER BY
            d ASC,
            category ASC,
            value ASC,
            name ASC
        LIMIT 2 BY d, category
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
FROM test_limit_by_all_old_planner
ORDER BY
    id ASC,
    category ASC,
    value ASC
LIMIT 1 BY id, category;