SELECT
  DISTINCT '(forward, head, A->B)',
  id,
  sequenceNextNodeDistinct('forward', 'head', 4) (
    dt,
    action,
    action = 'A',
    toNullable(1 IS NOT NULL)
    AND (NOT toNullable(isNullable(1)))
  ) IGNORE NULLS AS next_node
FROM
  events_demo
GROUP BY
  * WITH ROLLUP WITH TOTALS
ORDER BY
  ALL ASC NULLS LAST;
