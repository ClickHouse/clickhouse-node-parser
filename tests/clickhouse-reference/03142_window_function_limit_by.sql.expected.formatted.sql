SELECT
    k,
    `in` / out AS ratio,
    count(*) AS count_rows_w
FROM error_win_func
ORDER BY `ALL` ASC
LIMIT 1 BY k
WINDOW w AS (ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING);

SELECT
    n AS m,
    count() OVER (PARTITION BY m) AS cnt
FROM t
WHERE st IN ('x', 'y')
ORDER BY `ALL` ASC
LIMIT 1 BY m;