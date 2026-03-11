SELECT count()
FROM `system`.events
WHERE event = 'LogFatal';

SELECT count() > 0
FROM `system`.events
WHERE event = 'LogTrace';