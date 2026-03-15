SET output_format_pretty_row_numbers = 0;

SET print_pretty_type_names = 0;

SET output_format_pretty_named_tuples_as_json = 0;

CREATE TABLE t_merge_tree_index
(
    a UInt64,
    b UInt64,
    sp UInt64,
    arr Array(LowCardinality(String)),
    n Nested(c1 String, c2 UInt64),
    t Tuple(c1 UInt64, c2 UInt64),
    `column.with.dots` UInt64
)
ENGINE = MergeTree
ORDER BY (a, b, sipHash64(sp) % 100)
SETTINGS index_granularity = 3, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 6, ratio_of_defaults_for_sparse_serialization = 0.9, write_marks_for_substreams_in_compact_parts = 0, serialization_info_version = 'basic', compact_parts_max_granules_to_buffer = 1;

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

SET describe_compact_output = 1;