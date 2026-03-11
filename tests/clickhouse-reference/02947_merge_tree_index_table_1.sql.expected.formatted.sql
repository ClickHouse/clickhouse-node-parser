SELECT *
FROM t_merge_tree_index
ORDER BY
    _part ASC,
    a ASC,
    b ASC;

SELECT *
FROM mergeTreeIndex(currentDatabase(), t_merge_tree_index)
ORDER BY
    part_name ASC,
    mark_number ASC
FORMAT PrettyCompactNoEscapesMonoBlock;

SELECT *
FROM mergeTreeIndex(currentDatabase(), t_merge_tree_index, with_marks = true)
ORDER BY
    part_name ASC,
    mark_number ASC
FORMAT PrettyCompactNoEscapesMonoBlock;