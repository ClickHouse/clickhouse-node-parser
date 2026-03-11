SELECT
    ifNull('x', 'y') AS res,
    toTypeName(res);

SELECT
    ifNull(materialize('x'), materialize('y')) AS res,
    toTypeName(res);

SELECT
    ifNull(toNullable('x'), 'y') AS res,
    toTypeName(res);

SELECT
    ifNull(toNullable('x'), materialize('y')) AS res,
    toTypeName(res);

SELECT
    ifNull('x', toNullable('y')) AS res,
    toTypeName(res);

SELECT
    ifNull(materialize('x'), toNullable('y')) AS res,
    toTypeName(res);

SELECT
    ifNull(toNullable('x'), toNullable('y')) AS res,
    toTypeName(res);

SELECT
    ifNull(toString(number), toString(negate(number))) AS res,
    toTypeName(res)
FROM `system`.numbers
LIMIT 5;

SELECT
    ifNull(nullIf(toString(number), '1'), toString(negate(number))) AS res,
    toTypeName(res)
FROM `system`.numbers
LIMIT 5;

SELECT
    ifNull(toString(number), nullIf(toString(negate(number)), '-3')) AS res,
    toTypeName(res)
FROM `system`.numbers
LIMIT 5;

SELECT
    ifNull(nullIf(toString(number), '1'), nullIf(toString(negate(number)), '-3')) AS res,
    toTypeName(res)
FROM `system`.numbers
LIMIT 5;

SELECT
    ifNull(NULL, 1) AS res,
    toTypeName(res);

SELECT
    ifNull(1, NULL) AS res,
    toTypeName(res);

SELECT
    ifNull(NULL, NULL) AS res,
    toTypeName(res);