DROP TABLE IF EXISTS ttt01778;

CREATE TABLE ttt01778
(
    `1` String,
    `2` INT
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO ttt01778;

SELECT *
FROM ttt01778
WHERE 1 = 2; -- no server error

DROP TABLE ttt01778;