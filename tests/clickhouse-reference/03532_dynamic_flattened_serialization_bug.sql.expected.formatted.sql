-- Tags: no-fasttest
SET type_json_skip_duplicated_paths = 1;

CREATE TABLE t0
(
    c0 Variant(Int,JSON(max_dynamic_paths=3, max_dynamic_types=13))
)
ENGINE = SummingMergeTree()
ORDER BY tuple();

SELECT c0
FROM t0 FINAL
SETTINGS output_format_native_use_flattened_dynamic_and_json_serialization = 1;