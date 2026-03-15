CREATE TABLE t0
(
    c0 Dynamic
)
ENGINE = Memory;

SELECT caseWithExpression(1, c0, 1, NULL)
FROM t0;