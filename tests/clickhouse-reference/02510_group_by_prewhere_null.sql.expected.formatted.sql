DROP TABLE IF EXISTS table1;

CREATE TABLE table1
(
    col1 Int32,
    col2 Int32
)
ENGINE = MergeTree
ORDER BY col1
PARTITION BY tuple();

INSERT INTO table1;

DROP TABLE table1;