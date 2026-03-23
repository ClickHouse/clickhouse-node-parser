CREATE TABLE t_final_collapsing
(
    key Int8,
    sign Int8
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY key;

INSERT INTO t_final_collapsing;

SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 0, split_intersecting_parts_ranges_into_layers_final = 0;

SELECT count()
FROM t_final_collapsing FINAL;

SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 0, split_intersecting_parts_ranges_into_layers_final = 1;

SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 1, split_intersecting_parts_ranges_into_layers_final = 0;

SET split_parts_ranges_into_intersecting_and_non_intersecting_final = 1, split_intersecting_parts_ranges_into_layers_final = 1;

CREATE TABLE t_final_collapsing
(
    key Int8,
    sign Int8,
    version UInt64
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY key;

INSERT INTO t_final_collapsing;