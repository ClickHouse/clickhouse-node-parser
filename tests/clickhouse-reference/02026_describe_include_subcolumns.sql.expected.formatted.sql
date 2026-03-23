SET output_format_pretty_fallback_to_vertical = 0;

SYSTEM DROP  TABLE IF EXISTS t_desc_subcolumns;

CREATE TABLE t_desc_subcolumns
(
    d Date,
    n Nullable(String) COMMENT 'It is a nullable column',
    arr1 Array(UInt32) CODEC(ZSTD),
    arr2 Array(Array(String)) TTL d + toIntervalDay(1),
    t Tuple(s String, a Array(Tuple(a UInt32, b UInt32))) CODEC(ZSTD)
)
ENGINE = MergeTree
ORDER BY d;

SYSTEM DROP  TABLE t_desc_subcolumns;