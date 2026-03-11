SELECT * FROM mergeTreeIndex(currentDatabase(), t_merge_tree_index) ORDER BY part_name, mark_number FORMAT PrettyCompactNoEscapesMonoBlock;
SELECT * FROM mergeTreeIndex(currentDatabase(), t_merge_tree_index, with_marks = true) ORDER BY part_name, mark_number FORMAT PrettyCompactNoEscapesMonoBlock;
