SELECT
    CounterID,
    dummy
FROM merge_tree
WHERE dummy <> ''
LIMIT 10;