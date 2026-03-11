SELECT tupleElement(arrayJoin([(1, 1)]), 1) FROM A_M PREWHERE tupleElement((1, 1), 1) =1;
SELECT tupleElement(arrayJoin([(1, 1)]), 1) FROM A_M WHERE tupleElement((1, 1), 1) =1;
SELECT tupleElement(arrayJoin([(1, 1)]), 1) FROM A1 PREWHERE tupleElement((1, 1), 1) =1;
