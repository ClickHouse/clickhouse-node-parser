-- Tags: no-msan

CREATE TABLE 03593_backup_with_broken_projection
(
    `id` UInt64,
    `string` String,
    `time1` DateTime64(6),
    `time2` DateTime64(6),
    PROJECTION max_time
    (
        SELECT
            string,
            max(time1),
            max(time2)
        GROUP BY string
    )
)
ENGINE = MergeTree
ORDER BY time1;
