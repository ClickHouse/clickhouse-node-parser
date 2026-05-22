SELECT transform(1, [1, 1, 1], [1, 4, 5]);

SELECT transform('1', ['1', '1', '1'], ['1', '4', '5']);

SELECT transform((0, 0), [(0, 0), (0, 0), (0, 0)], [(2, 2), (5, 5), (10, 10)]);

-- https://github.com/ClickHouse/ClickHouse/issues/62183
-- Case is turned into caseWithExpression, which then it's turned into transform
SELECT caseWithExpression(1, 1, 2, 1, 4, NULL);