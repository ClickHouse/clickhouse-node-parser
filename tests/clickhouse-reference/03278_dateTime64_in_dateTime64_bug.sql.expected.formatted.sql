SELECT *
FROM datetime64_issue
WHERE dt IN (toDateTime64('2001-01-11 01:11:21.100', 3));

SELECT *
FROM datetime64_issue
WHERE dtn IN (toDateTime64('2001-01-11 01:11:21.100', 3));