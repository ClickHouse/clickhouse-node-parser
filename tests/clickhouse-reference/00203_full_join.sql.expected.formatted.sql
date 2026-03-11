SELECT
    k,
    x,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
FULL JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k,
    x
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
FULL JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
FULL JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    x,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
FULL JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT k
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
FULL JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k,
    x,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
RIGHT JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k,
    x
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
RIGHT JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
RIGHT JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    x,
    y
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
RIGHT JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT k
FROM
    (
        SELECT
            arrayJoin([1, 2, 3]) AS k,
            'Hello' AS x
    )
RIGHT JOIN (
        SELECT
            range(k) AS y,
            arrayJoin([3, 4, 5]) AS k
    )
    USING (k)
WHERE k < 10
ORDER BY k ASC;

SELECT
    k1,
    k2,
    k3,
    val_t1,
    val_t2
FROM
    t1_00203
FULL JOIN t2_00203
    USING (k3, k1, k2)
ORDER BY
    k1 ASC,
    k2 ASC,
    k3 ASC;

SELECT
    k1,
    k2,
    k3,
    val_t1,
    val_t2
FROM
    t1_00203
RIGHT JOIN t2_00203
    USING (k3, k1, k2)
ORDER BY
    k1 ASC,
    k2 ASC,
    k3 ASC;