SET optimize_use_projections = 1;

CREATE TABLE x
(
    pk int,
    arr Array(int),
    PROJECTION p (    SELECT arr
    ORDER BY pk ASC)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT a
FROM
    x
ARRAY JOIN arr AS a;