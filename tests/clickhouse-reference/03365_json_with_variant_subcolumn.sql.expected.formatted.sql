SET allow_experimental_variant_type = 1;

SET enable_json_type = 1;

CREATE TABLE json_test
(
    id String,
    json JSON(foo Variant(String, Array(String)))
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/json_test', '1')
ORDER BY id
PARTITION BY tuple()
SETTINGS index_granularity = 8192, min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0;

SELECT count(*)
FROM json_test;