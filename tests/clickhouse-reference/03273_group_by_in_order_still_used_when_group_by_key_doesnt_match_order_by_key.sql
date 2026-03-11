SELECT trimBoth(replaceRegexpAll(explain, '__table1.', ''))
FROM
(
  EXPLAIN actions = 1
  SELECT count(*)
  FROM test
  GROUP BY
      b,
      a
  SETTINGS optimize_aggregation_in_order = 1
)
WHERE explain LIKE '%Order%';
