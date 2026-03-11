SELECT id IS NULL, n IS NULL, n IS NOT NULL FROM t_func_to_subcolumns ORDER BY id;
SELECT length(arr), empty(arr), notEmpty(arr), empty(n) FROM t_func_to_subcolumns ORDER BY id;
SELECT mapKeys(m), mapValues(m) FROM t_func_to_subcolumns ORDER BY id;
SELECT count(n) FROM t_func_to_subcolumns;
SELECT count(id) FROM t_func_to_subcolumns;
SELECT id, left.n IS NULL, right.n IS NULL FROM t_func_to_subcolumns AS left
FULL JOIN (SELECT 1 AS id, 'qqq' AS n UNION ALL SELECT 3 AS id, 'www') AS right USING(id)
ORDER BY id;
SELECT t IS NULL, t.null FROM t_tuple_null;
