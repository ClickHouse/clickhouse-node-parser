SELECT
    (tan(t3.c0)),
    SUM(-1017248723),
    ((t3.c0) % (t3.c0))
FROM t3
GROUP BY t3.c0
SETTINGS
    aggregate_functions_null_for_empty = 1,
    enable_optimize_predicate_expression = 0;

SELECT
    (tan(t3.c0)),
    SUM(-1017248723),
    ((t3.c0) % (t3.c0))
FROM t3
GROUP BY t3.c0
HAVING (tan((negate((SUM(-1017248723))))))
    AND (sqrt(SUM(-1017248723)))
UNION ALL
SELECT
    (tan(t3.c0)),
    SUM(-1017248723),
    ((t3.c0) % (t3.c0))
FROM t3
GROUP BY t3.c0
HAVING (NOT((tan((negate((SUM(-1017248723))))))
    AND (sqrt(SUM(-1017248723)))))
UNION ALL
SELECT
    (tan(t3.c0)),
    SUM(-1017248723),
    ((t3.c0) % (t3.c0))
FROM t3
GROUP BY t3.c0
HAVING (isNull(((tan((negate((SUM(-1017248723))))))
    AND (sqrt(SUM(-1017248723))))))
SETTINGS
    aggregate_functions_null_for_empty = 1,
    enable_optimize_predicate_expression = 0;