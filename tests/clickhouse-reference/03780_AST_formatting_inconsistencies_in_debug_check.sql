SELECT ([1] AS foo), [1] IN ([1] AS foo);
SELECT ([isNaN(1)] AS foo), [1] IN ([isNaN(1)] AS foo);
SELECT (-((-`c1`) AS `a2`)), NOT (-((-`c1`) AS `a2`)) from tab;
SELECT 'test' SETTINGS max_query_size = 9223372036854775309;
SELECT ((SELECT [1,2,3]) AS a1), [5] IN ((SELECT [1,2,3]) AS a1);
SELECT ((SELECT 1) AS a1), NOT ((SELECT 1) AS a1);
SELECT tuple(1, 'a') AS a1, tuple(1, 'a') IN (tuple(1, 'a') AS a1);
SELECT * FROM t1 JOIN t2 ON ((t1.x = t2.x) AND (t1.x IS NULL) AS e2);
SELECT tuple(1, 'a') AS a1, NOT (tuple(1, 'a') AS a1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT 1,2,3 EXCEPT SELECT 1,2,3;
