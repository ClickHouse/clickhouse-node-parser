SYSTEM drop  table if exists x;

CREATE TABLE x
(
    i int
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO x;

SYSTEM drop  table x;