SELECT sleep(1)
FORMAT Null; -- sleep a bit to wait possible merges after insert

SELECT sum(a)
FROM t
WHERE a IN (0, 3)
    AND b = 0;