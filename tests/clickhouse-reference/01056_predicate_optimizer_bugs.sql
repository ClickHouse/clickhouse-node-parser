SELECT k, v, d, i FROM (SELECT t.1 AS k, t.2 AS v, runningDifference(v) AS d, runningDifference(cityHash64(t.1)) AS i FROM (   SELECT arrayJoin([('a', 1), ('a', 2), ('a', 3), ('b', 11), ('b', 13), ('b', 15)]) AS t)) WHERE i = 0;
SELECT co,co2,co3,num FROM ( SELECT co,co2,co3,count() AS num FROM (SELECT dummy+1 AS co,dummy+2 AS co2 ,dummy+3 AS co3) GROUP BY cube (co,co2,co3) ) WHERE co!=0 AND co2 !=2;
SELECT name FROM ( SELECT name FROM system.settings ) ANY INNER JOIN ( SELECT name FROM system.settings ) USING (name) WHERE name = 'enable_optimize_predicate_expression';
SELECT * FROM view1 WHERE id = 1;
SELECT ccc FROM ( SELECT 1 AS ccc UNION ALL SELECT * FROM ( SELECT 2 AS ccc ) ANY INNER JOIN ( SELECT 2 AS ccc ) USING (ccc) ) WHERE ccc > 1;
SELECT B, neighbor(B, 1) AS next_B FROM (SELECT * FROM test ORDER BY B);
SELECT B, neighbor(B, 1) AS next_B FROM (SELECT * FROM test ORDER BY B) WHERE A == 1;
SELECT B, next_B FROM (SELECT A, B, neighbor(B, 1) AS next_B FROM (SELECT * FROM test ORDER BY B)) WHERE A == 1;
SELECT * FROM (SELECT * FROM system.one) WHERE arrayMap(x -> x + 1, [dummy]) = [1];
SELECT *  FROM (SELECT 1 AS id, 2 AS value) INNER JOIN (SELECT 1 AS id, 3 AS value_1) USING id WHERE arrayMap(x -> x + value + value_1, [1]) = [6];
-- from #10613
SELECT name, count() AS cnt
FROM remote('127.{1,2}', system.settings)
GROUP BY name
HAVING (max(value) > '9') AND (min(changed) = 0)
FORMAT Null;
