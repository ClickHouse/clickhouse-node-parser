EXPLAIN AST
SELECT tupleElement(255, 100);

EXPLAIN AST
SELECT (255, 1).1;

SELECT (255, 1).1;

EXPLAIN AST
SELECT
    *.2,
    x.1
FROM (
        SELECT arrayJoin([(0,1)]) AS x
    );

SELECT
    *.2,
    x.1
FROM (
        SELECT arrayJoin([(0,1)]) AS x
    );