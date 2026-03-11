SELECT *
FROM table_1;

SELECT *
FROM table_1
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM table_1
SETTINGS additional_table_filters = map('table_1', 'x != 2 and x != 3');

SELECT x
FROM table_1
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT y
FROM table_1
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM table_1
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM table_1
PREWHERE x != 4
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM table_1
PREWHERE x != 4
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
PREWHERE x != 4
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
PREWHERE x != 4
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT y
FROM table_1
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT y
FROM table_1
PREWHERE x != 4
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT y
FROM table_1
PREWHERE x != 4
WHERE x != 3
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
WHERE x != 2
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
PREWHERE x != 2
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT x
FROM table_1
PREWHERE x != 2
WHERE x != 2
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM remote('127.0.0.{1,2}', `system`.one)
SETTINGS additional_table_filters = map('system.one', 'dummy = 0');

SELECT *
FROM remote('127.0.0.{1,2}', `system`.one)
SETTINGS additional_table_filters = map('system.one', 'dummy != 0');

SELECT *
FROM distr_table
SETTINGS additional_table_filters = map('distr_table', 'x = 2');

SELECT *
FROM distr_table
SETTINGS additional_table_filters = map('distr_table', 'x != 2 and x != 3');

SELECT *
FROM `system`.numbers
LIMIT 5;

SELECT *
FROM `system`.numbers AS t
LIMIT 5
SETTINGS additional_table_filters = map('t', 'number % 2 != 0');

SELECT *
FROM `system`.numbers
LIMIT 5
SETTINGS additional_table_filters = map('system.numbers', 'number != 3');

SELECT *
FROM `system`.numbers
LIMIT 5
SETTINGS additional_table_filters = map('system.numbers', 'number != 3', 'table_1', 'x!=2');

SELECT *
FROM (
        SELECT number
        FROM `system`.numbers
        LIMIT 5
        UNION ALL
        SELECT x
        FROM table_1
    )
ORDER BY number ASC
SETTINGS additional_table_filters = map('system.numbers', 'number != 3', 'table_1', 'x!=2');

SELECT
    number,
    x,
    y
FROM
    (
        SELECT number
        FROM `system`.numbers
        LIMIT 5
    ) AS f
LEFT JOIN (
        SELECT
            x,
            y
        FROM table_1
    ) AS s
    ON f.number = s.x
ORDER BY `all` ASC
SETTINGS additional_table_filters = map('system.numbers', 'number != 3', 'table_1', 'x != 2');

SELECT b + 1 AS c
FROM (
        SELECT a + 1 AS b
        FROM (
                SELECT x + 1 AS a
                FROM table_1
            )
    )
SETTINGS additional_table_filters = map('table_1', 'x != 2 and x != 3');

SELECT dummy
FROM `system`.one
SETTINGS additional_table_filters = map('system.one', 'dummy in (select number from numbers(2))');

SELECT *
FROM v_numbers;

SELECT *
FROM v_numbers
SETTINGS additional_table_filters = map('system.numbers', 'number != 3');

SELECT *
FROM v_numbers
SETTINGS additional_table_filters = map('v_numbers', 'x != 3');

SELECT *
FROM v_numbers
SETTINGS additional_table_filters = map('system.numbers', 'number != 3', 'v_numbers', 'x != 3');

SELECT *
FROM mv_table;

SELECT *
FROM mv_table
SETTINGS additional_table_filters = map('mv_table', 'x != 5');

SELECT *
FROM mv_table
SETTINGS additional_table_filters = map('table_1', 'x != 5');

SELECT *
FROM mv_table
SETTINGS additional_table_filters = map('table_2', 'x != 5');

SELECT *
FROM m_table
ORDER BY x ASC;

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x != 2');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_2', 'x != 5');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x != 2', 'table_2', 'x != 5');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x != 4');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_2', 'x != 4');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x != 4', 'table_2', 'x != 4');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('m_table', 'x != 4');

SELECT *
FROM m_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('m_table', 'x != 4', 'table_1', 'x != 2', 'table_2', 'x != 5');

SELECT *
FROM table_1
SETTINGS additional_result_filter = 'x != 2';

SELECT
    *,
    x != 2
FROM table_1
SETTINGS additional_result_filter = 'x != 2';

SELECT *
FROM table_1
WHERE x != 1
SETTINGS additional_result_filter = 'x != 2';

SELECT *
FROM table_1
WHERE x != 1
SETTINGS additional_result_filter = 'x != 2 and x != 3';

SELECT *
FROM table_1
PREWHERE x != 3
WHERE x != 1
SETTINGS additional_result_filter = 'x != 2';

SELECT *
FROM table_1
LIMIT 3
SETTINGS additional_result_filter = 'x != 2';

SELECT x + 1
FROM table_1
SETTINGS additional_result_filter = '`plus(x, 1)` != 2';

SELECT *
FROM (
        SELECT
            x + 1 AS a,
            y
        FROM table_1
        UNION ALL
        SELECT
            x AS a,
            y
        FROM table_1
    )
ORDER BY
    a ASC,
    y ASC
SETTINGS additional_result_filter = 'a = 3';

SELECT *
FROM (
        SELECT
            x + 1 AS a,
            y
        FROM table_1
        UNION ALL
        SELECT
            x AS a,
            y
        FROM table_1
    )
ORDER BY
    a ASC,
    y ASC
SETTINGS additional_result_filter = 'a != 3';