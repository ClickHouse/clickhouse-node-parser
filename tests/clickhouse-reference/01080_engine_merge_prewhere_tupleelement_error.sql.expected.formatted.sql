SELECT arrayJoin([(1, 1)]).1
FROM A_M
PREWHERE (1, 1).1 = 1;

SELECT arrayJoin([(1, 1)]).1
FROM A_M
WHERE (1, 1).1 = 1;

SELECT arrayJoin([(1, 1)]).1
FROM A1
PREWHERE (1, 1).1 = 1;