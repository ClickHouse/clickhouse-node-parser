SET allow_experimental_statistics = 1;

SET use_statistics = 1;

SET enable_analyzer = 1;

SET materialize_statistics_on_insert = 0;

CREATE TABLE tab
(
    a Int64 STATISTICS(tdigest),
    b Int16 STATISTICS(tdigest)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, enable_vertical_merge_algorithm = 0; -- TODO: there is a bug in vertical merge with statistics.

SELECT replaceRegexpAll(`explain`, '__table1\\.', '')
FROM (
        EXPLAIN actions = 1
        SELECT count(*)
        FROM tab
        WHERE b < 10
            AND a < 10
    )
WHERE like(`explain`, '%Prewhere%'); -- checks b first, then a (statistics not used)

SET mutations_sync = 2;