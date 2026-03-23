SET optimize_use_projections = 1;

SYSTEM drop  table if exists x;

CREATE TABLE x
(
    pk int,
    arr Array(int),
    PROJECTION p (    SELECT arr
    ORDER BY pk ASC)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO x;

SELECT a
FROM
    x
ARRAY JOIN arr AS a;

SYSTEM drop  table x;