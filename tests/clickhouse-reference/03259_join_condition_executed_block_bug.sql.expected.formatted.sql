SELECT t1.*
FROM
    t1
FULL JOIN t2
    ON t1.key = t2.key
    AND ((t1.a = 2
    OR indexHint(t2.a = 2)))
FORMAT Null;