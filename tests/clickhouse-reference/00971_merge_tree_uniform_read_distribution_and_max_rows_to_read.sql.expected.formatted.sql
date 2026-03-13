SELECT count()
FROM merge_tree;

-- constant ignore will be pruned by part pruner. ignore(*) is used.
SELECT count()
FROM merge_tree
WHERE NOT ignore(*); -- { serverError TOO_MANY_ROWS }