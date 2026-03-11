SELECT replaceRegexpAll(explain, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas')
FROM (
   EXPLAIN distributed = 1
    SELECT a
      FROM t
  GROUP BY a
);
SELECT replaceRegexpAll(explain, 'ReadFromRemoteParallelReplicas.*', 'ReadFromRemoteParallelReplicas')
FROM (
   EXPLAIN distributed = 1
    SELECT a
      FROM t
);
