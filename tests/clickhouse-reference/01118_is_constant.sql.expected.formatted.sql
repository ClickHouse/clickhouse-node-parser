SELECT isConstant(1);

SELECT isConstant([1]);

SELECT isConstant(arrayJoin([1]));

SELECT isConstant((
        SELECT 1
    ));

SELECT isConstant(x)
FROM (
        SELECT 1 AS x
    );

SELECT '---';

SELECT isConstant(x)
FROM (
        SELECT 1 AS x
        UNION ALL
        SELECT 2
    );

SELECT isConstant();

SELECT isConstant(1, 2);