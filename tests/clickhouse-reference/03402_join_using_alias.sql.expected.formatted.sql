SELECT c0
FROM
    remote('localhost', currentDatabase(), 't0') AS tx
INNER JOIN t0
    USING (c1)
ORDER BY c0 ASC;

SELECT c0
FROM
    t1_dist AS tx
INNER JOIN t0
    USING (c1)
ORDER BY c0 ASC;

SELECT c0
FROM
    t1_dist AS tx
INNER JOIN t0
    USING (c2);