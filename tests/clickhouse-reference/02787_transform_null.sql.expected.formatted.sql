SELECT transform(0, [0, 1], ['ZERO', 'ONE'], 'DEFAULT') AS result;

SELECT transform(0, [0, 1], ['ZERO', 'ONE'], NULL) AS result;

SELECT caseWithExpression(1, 0, 'ZERO', 1, 'ONE', 'NONE') AS result;

SELECT caseWithExpression(1, 0, NULL, 1, 'ONE', 'NONE') AS result;

SELECT caseWithExpression(1, 1, 'a', 'b') AS value;

SELECT caseWithExpression(1, 1, 'a', NULL) AS value;

SELECT
    d,
    toInt16OrNull(d),
    caseWithExpression(d, 'a', 3, toInt16OrZero(d)) AS case_zero,
    caseWithExpression(d, 'a', 3, toInt16OrNull(d)) AS case_null,
    if(d = 'a', 3, toInt16OrZero(d)) AS if_zero,
    if(d = 'a', 3, toInt16OrNull(d)) AS if_null
FROM (
        SELECT arrayJoin(['', '1', 'a']) AS d
    )
ORDER BY
    case_zero ASC,
    d ASC;