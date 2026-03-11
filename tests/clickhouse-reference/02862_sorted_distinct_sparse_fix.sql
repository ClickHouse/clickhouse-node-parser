
SELECT name, column, serialization_kind
FROM system.parts_columns
WHERE table = 't_sparse_distinct' AND database = currentDatabase() AND column = 'v'
ORDER BY name;
select splitByString(' ', trimLeft(explain))[1] from (explain pipeline SELECT DISTINCT id, v FROM t_sparse_distinct) where explain ilike '%DistinctSortedStreamTransform%';
SELECT DISTINCT id, v FROM t_sparse_distinct format Null;
