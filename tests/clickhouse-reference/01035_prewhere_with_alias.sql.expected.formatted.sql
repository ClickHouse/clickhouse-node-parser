SELECT b
FROM test
PREWHERE c = 1;

SELECT DISTINCT UserID
FROM audience_local
PREWHERE Date = toDate('2019-07-25')
    AND Release = '17.11.0.542';