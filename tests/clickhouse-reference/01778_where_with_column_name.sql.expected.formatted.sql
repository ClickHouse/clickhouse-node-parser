CREATE TABLE ttt01778
(
    `1` String,
    `2` INT
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM ttt01778
WHERE 1 = 2; -- no server error