SELECT count()
FROM (
        SELECT toStartOfMonth(date) AS d
        FROM t_sparse_sort_limit
        ORDER BY negate(i) ASC
        LIMIT 65536
    );