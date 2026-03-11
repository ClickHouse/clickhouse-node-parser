SELECT DISTINCT
    '(forward, head, A->B)',
    id,
    sequenceNextNodeDistinct('forward', 'head', 4)(dt, action, action = 'A', toNullable(isNotNull(1))
    AND (NOT toNullable(isNullable(1)))) AS next_node
FROM events_demo
GROUP BY *
WITH ROLLUP
WITH TOTALS
ORDER BY `ALL` ASC;