SELECT count()
FROM merge_tree;

SELECT count()
FROM merge_tree
WHERE NOT ignore(*);