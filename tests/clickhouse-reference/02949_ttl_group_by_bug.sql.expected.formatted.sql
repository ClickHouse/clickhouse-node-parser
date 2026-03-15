SET merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 0.0;

CREATE TABLE ttl_group_by_bug
(
    key UInt32,
    ts DateTime,
    value UInt32,
    min_value UInt32 DEFAULT value,
    max_value UInt32 DEFAULT value
)
ENGINE = MergeTree()
ORDER BY (key, toStartOfInterval(ts, toIntervalMinute(3)), ts)
TTL ts + toIntervalMinute(5);

SELECT *
FROM (
        SELECT
            _part,
            rowNumberInAllBlocks(),
            (key, toStartOfInterval(ts, toIntervalMinute(3)), ts) AS cur,
            lagInFrame((key, toStartOfInterval(ts, toIntervalMinute(3)), ts), 1) OVER () AS prev,
            1
        FROM ttl_group_by_bug
    )
WHERE cur < prev
LIMIT 2
SETTINGS max_threads = 1;