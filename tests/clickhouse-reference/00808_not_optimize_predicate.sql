SELECT '-------ENABLE OPTIMIZE PREDICATE-------';
SELECT * FROM (SELECT * FROM test_00808 FINAL) WHERE id = 1;
SELECT * FROM (SELECT * FROM test_00808 ORDER BY id LIMIT 1) WHERE id = 1;
SELECT * FROM (SELECT id FROM test_00808 GROUP BY id LIMIT 1 BY id) WHERE id = 1;
SELECT * FROM (SELECT * FROM test_00808 LIMIT 1) WHERE id = 1; -- { serverError INDEX_NOT_USED }
SELECT n, z, changed FROM (
  SELECT n, z, runningDifferenceStartingWithFirstValue(n) AS changed FROM (
     SELECT ts, n,z FROM system.one ARRAY JOIN [1,3,4,5,6] AS ts,
        [1,2,2,2,1] AS n, ['a', 'a', 'b', 'a', 'b'] AS z
      ORDER BY n, ts DESC
  )
) WHERE changed = 0;
SELECT arrayJoin(arrayMap(x -> x, arraySort(groupArray((ts, n))))) AS k FROM (
  SELECT ts, n, z FROM system.one ARRAY JOIN [1, 3, 4, 5, 6] AS ts, [1, 2, 2, 2, 1] AS n, ['a', 'a', 'b', 'a', 'b'] AS z
  ORDER BY n ASC, ts DESC
) WHERE z = 'a' GROUP BY z;
SELECT *
FROM
(
    SELECT
        n,
        finalizeAggregation(s)
    FROM test_00808_push_down_with_finalizeAggregation
)
WHERE (n >= 2) AND (n <= 5)
ORDER BY n;
