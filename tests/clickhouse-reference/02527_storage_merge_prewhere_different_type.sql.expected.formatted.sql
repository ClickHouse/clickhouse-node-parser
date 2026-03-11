SELECT Val
FROM merge1
PREWHERE Val = 65536
    OR Val = 2;

SELECT Val
FROM merge2
PREWHERE Val = 65536
    OR Val = 2;