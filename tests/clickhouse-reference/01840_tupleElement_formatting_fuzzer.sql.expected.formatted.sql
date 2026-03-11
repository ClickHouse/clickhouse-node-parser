SELECT (255, 1).1;

SELECT
    *.2,
    x.1
FROM (
        SELECT arrayJoin([(0,1)]) AS x
    );