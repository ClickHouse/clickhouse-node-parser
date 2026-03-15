SET use_variant_as_common_type = 1;

CREATE TABLE t0
(
    json Nullable(JSON)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1, write_marks_for_substreams_in_compact_parts = 1, min_bytes_for_wide_part = '100G';

SELECT
    json.a.b.e,
    json.a.b.e.:Int64,
    json.`^a`
FROM t0;