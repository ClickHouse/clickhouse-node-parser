SELECT
    number,
    caseWithExpression(number, 3, 55, 6, 77, 9, 95, multiIf(number = 1, 10, number = 10, 100, 555555)) AS LONG_COL_0
FROM `system`.numbers
LIMIT 20;