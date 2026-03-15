CREATE TABLE foo
(
    Id Int32,
    Val Int32
)
ENGINE = MergeTree
ORDER BY Id
PARTITION BY Val;

CREATE TABLE foo_merge AS foo
ENGINE = Merge(currentDatabase(), '^foo');

CREATE TABLE t2
(
    Id Int32,
    Val Int32,
    X Int32
)
ENGINE = Memory;

SET force_primary_key = 1, force_index_by_date = 1;

SELECT *
FROM foo_merge
WHERE Val = 3
    AND Id = 3;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
    AND t2.X == 4
GROUP BY X;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND ((Id = 3
    AND t2.X == 4))
GROUP BY X;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
GROUP BY X;

SELECT
    count(),
    X
FROM
    (
        SELECT *
        FROM foo_merge
    ) AS f
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
GROUP BY X;