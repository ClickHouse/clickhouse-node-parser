CREATE TABLE data
(
    key Int
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS prewarm_mark_cache = 0;

SET load_marks_asynchronously = 0;

INSERT INTO data;

--
-- SELECTs
--
SELECT *
FROM data
FORMAT Null
SETTINGS load_marks_asynchronously = 0;

SELECT *
FROM data
FORMAT Null
SETTINGS load_marks_asynchronously = 1;

SELECT
    query_kind,
    `Settings`['load_marks_asynchronously'] AS load_marks_asynchronously,
    ProfileEvents['MarkCacheHits'] AS hits,
    ProfileEvents['MarkCacheMisses'] AS misses
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query_kind IN ('Select', 'Insert')
    AND type != 'QueryStart'
ORDER BY event_time_microseconds ASC
FORMAT CSVWithNames;

SELECT
    part_name,
    ProfileEvents['MarkCacheHits'] AS hits,
    ProfileEvents['MarkCacheMisses'] AS misses
FROM `system`.part_log
WHERE database = currentDatabase()
    AND event_type = 'MergeParts'
ORDER BY event_time_microseconds ASC
FORMAT CSVWithNames;