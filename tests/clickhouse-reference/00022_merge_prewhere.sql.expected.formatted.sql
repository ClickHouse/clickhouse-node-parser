SELECT count()
FROM merge_hits
WHERE AdvEngineID = 2;

SELECT count()
FROM merge_hits
PREWHERE AdvEngineID = 2;