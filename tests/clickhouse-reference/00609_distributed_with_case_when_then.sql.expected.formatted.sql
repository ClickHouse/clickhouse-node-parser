SELECT caseWithExpression(x, 1, 'hello', 2, 'world', 'unknow')
FROM mergetree_00609;

SELECT count() AS cnt
FROM (
        SELECT caseWithExpression(x, 1, 'hello', 2, 'world', 'unknow')
        FROM mergetree_00609
    );

SELECT caseWithExpression(x, 1, 'hello', 2, 'world', 'unknow')
FROM distributed_00609;

SELECT count() AS cnt
FROM (
        SELECT caseWithExpression(x, 1, 'hello', 2, 'world', 'unknow')
        FROM distributed_00609
    );