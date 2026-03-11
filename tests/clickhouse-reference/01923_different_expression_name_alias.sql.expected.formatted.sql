SELECT count()
FROM merge_tree_table;

SELECT identity(CharID) AS x
FROM distributed_tbl
WHERE (Date = toDate('2016-03-01'))
    AND (User = 1486392)
    AND (x = 0);