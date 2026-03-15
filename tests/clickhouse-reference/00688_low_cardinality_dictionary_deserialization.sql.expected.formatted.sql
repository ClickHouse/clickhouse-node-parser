CREATE TABLE lc_dict_reading
(
    val UInt64,
    str LowCardinality(String),
    pat String
)
ENGINE = MergeTree
ORDER BY val
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    sum(toUInt64(str)),
    sum(toUInt64(pat))
FROM lc_dict_reading
WHERE val < 8129
    OR val > 8192 * 4;