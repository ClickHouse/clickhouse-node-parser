SELECT count() FROM (SELECT toStartOfMonth(date) AS d FROM t_sparse_sort_limit ORDER BY -i LIMIT 65536);
