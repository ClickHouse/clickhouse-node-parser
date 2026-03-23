CREATE TABLE x
(
    i int
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO x;