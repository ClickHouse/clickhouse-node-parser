CREATE TABLE t1
(
    c0 Int32,
    PRIMARY KEY(c0)
)
ENGINE = MergeTree;

INSERT INTO t1;

SELECT MIN(t1.c0)
FROM t1
GROUP BY
    (negate(sign(cos(t1.c0)))) * (negate(max2(t1.c0, t1.c0 / t1.c0))),
    t1.c0 * t1.c0,
    sign(negate(exp(negate(t1.c0))))
HAVING negate((negate((MIN(t1.c0) + MIN(t1.c0)))))
    AND (isNotNull(pow('{b' > '-657301241', log(-1004522121))))
UNION ALL
SELECT MIN(t1.c0)
FROM t1
GROUP BY
    (negate(sign(cos(t1.c0)))) * (negate(max2(t1.c0, t1.c0 / t1.c0))),
    t1.c0 * t1.c0,
    sign(negate(exp(negate(t1.c0))))
HAVING NOT(negate((negate((MIN(t1.c0) + MIN(t1.c0)))))
    AND (isNotNull(pow('{b' > '-657301241', log(-1004522121)))))
UNION ALL
SELECT MIN(t1.c0)
FROM t1
GROUP BY
    (negate(sign(cos(t1.c0)))) * (negate(max2(t1.c0, t1.c0 / t1.c0))),
    t1.c0 * t1.c0,
    sign(negate(exp(negate(t1.c0))))
HAVING isNull((negate((negate((MIN(t1.c0) + MIN(t1.c0)))))
    AND (isNotNull(pow('{b' > '-657301241', log(-1004522121))))))
SETTINGS
    aggregate_functions_null_for_empty = 1,
    enable_optimize_predicate_expression = 0;

SELECT MIN(t1.c0)
FROM t1
GROUP BY t1.c0
HAVING and(MIN(t1.c0) + MIN(t1.c0), 1)
SETTINGS
    aggregate_functions_null_for_empty = 1,
    enable_optimize_predicate_expression = 0;