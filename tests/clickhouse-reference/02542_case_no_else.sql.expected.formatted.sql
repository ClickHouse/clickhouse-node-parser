SELECT caseWithExpression(1, 1, 2, NULL);

SELECT
    id,
    caseWithExpression(id, 1, 'Z', NULL) AS x
FROM (
        SELECT 1 AS id
    );

SELECT
    id,
    caseWithExpression(id, 1, 'Z', 'X') AS x
FROM (
        SELECT 1 AS id
    );