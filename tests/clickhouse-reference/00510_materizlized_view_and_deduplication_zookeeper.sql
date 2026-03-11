SELECT count() FROM with_deduplication;
SELECT count() FROM without_deduplication;
SELECT countMerge(cnt) FROM with_deduplication_mv;
SELECT countMerge(cnt) FROM without_deduplication_mv;
