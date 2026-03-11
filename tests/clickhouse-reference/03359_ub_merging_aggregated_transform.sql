SELECT
  c0 + -1,
  sum(intDivOrZero(intDivOrZero(NULL, NULL), '2'), intDivOrZero(10000000000., intDivOrZero(intDivOrZero(intDivOrZero(NULL, NULL), 10), NULL)))
FROM t_having
GROUP BY
  c0 = 2,
  c0 = 10,
  intDivOrZero(intDivOrZero(intDivOrZero(NULL, NULL), NULL), NULL),
  c0
HAVING c0 = 2;
