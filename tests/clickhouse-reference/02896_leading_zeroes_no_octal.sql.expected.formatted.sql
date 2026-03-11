SELECT
    t.val == t.expected AS ok,
    *
FROM t_leading_zeroes AS t
ORDER BY id ASC;

SELECT
    t.val == t.expected AS ok,
    *
FROM t_leading_zeroes_f AS t
ORDER BY id ASC;