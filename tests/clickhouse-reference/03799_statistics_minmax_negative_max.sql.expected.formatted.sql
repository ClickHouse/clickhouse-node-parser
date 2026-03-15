CREATE TABLE tab
(
    i8 Int8,
    i16 Int16,
    i32 Int32,
    i64 Int64,
    i128 Int128,
    i256 Int256,
    bf16 BFloat16,
    f32 Float32,
    f64 Float32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS auto_statistics_types = 'minmax';

SELECT
    column,
    estimates.min,
    estimates.max
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'tab';