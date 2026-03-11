SELECT
    k,
    in / out AS ratio,
    count(*) OVER w AS count_rows_w
FROM error_win_func
WINDOW
    w AS (ROWS BETWEEN CURRENT ROW AND 3 FOLLOWING)
ORDER BY ALL
LIMIT 1 BY
    k;
SELECT
  n as m,
  count() OVER (PARTITION BY m) cnt
FROM t
WHERE st IN ('x', 'y')
ORDER BY ALL
LIMIT 1 BY m;
