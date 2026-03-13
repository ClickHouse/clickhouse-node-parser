-- In worst case doesn't check anything, but it's not flaky
SELECT sleep(3)
FORMAT Null;

SELECT count()
FROM partslost_0;

SELECT count()
FROM partslost_1;

SELECT count()
FROM partslost_2;