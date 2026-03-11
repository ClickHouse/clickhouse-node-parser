SELECT v.start, v.total_sec
FROM broken_view v FINAL
WHERE v.start IS NOT NULL;
