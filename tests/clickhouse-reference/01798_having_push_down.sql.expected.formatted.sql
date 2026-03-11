SELECT
    sum(c0 = 0),
    min(c0 + 1),
    sum(c0 + 2)
FROM t_having
GROUP BY c0
HAVING c0 = 0
SETTINGS enable_optimize_predicate_expression = 0;

SELECT
    c0 + -1,
    sum(intDivOrZero(intDivOrZero(NULL, NULL), '2'), intDivOrZero(10000000000., intDivOrZero(intDivOrZero(intDivOrZero(NULL, NULL), 10), NULL)))
FROM t_having
GROUP BY
    c0 = 2,
    c0 = 10,
    intDivOrZero(intDivOrZero(intDivOrZero(NULL, NULL), NULL), NULL),
    c0
HAVING c0 = 2
SETTINGS enable_optimize_predicate_expression = 0;

SELECT sum(c0 + 257)
FROM t_having
GROUP BY
    c0 = -9223372036854775808,
    NULL,
    -2147483649,
    c0
HAVING c0 = -9223372036854775808
SETTINGS enable_optimize_predicate_expression = 0;

SELECT
    c0 + -2,
    c0 + -9223372036854775807,
    c0 = NULL
FROM t_having
GROUP BY
    c0 = 0.9998999834060669,
    1023,
    c0
HAVING c0 = 0.9998999834060669
SETTINGS enable_optimize_predicate_expression = 0;

SELECT
    sum(c0 = 0),
    min(c0 + 1),
    sum(c0 + 2)
FROM t_having
GROUP BY c0
HAVING c0 = 0;

SELECT c1
FROM t_exact
GROUP BY
    c1,
    c0
HAVING c0;

SELECT 1
FROM remote('127.0.0.{1,1}')
GROUP BY (2, materialize(3))
HAVING materialize(3)
SETTINGS group_by_use_nulls = true;