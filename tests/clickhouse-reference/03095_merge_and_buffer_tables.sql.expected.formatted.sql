CREATE TABLE mt1
(
    f1 Int32,
    f2 Int32
)
ENGINE = MergeTree()
ORDER BY f1;

CREATE TABLE mt2 AS mt1
ENGINE = MergeTree()
ORDER BY f1;

CREATE TABLE b AS mt1
ENGINE = Buffer(currentDatabase(), mt2, 16, 1, 1, 10000, 1000000, 10000000, 100000000);

CREATE TABLE m AS mt1
ENGINE = Merge(currentDatabase(), '^(mt1|b)$');

-- do select
SELECT
    f1,
    f2
FROM m
WHERE f1 = 1
    AND f2 = 1;