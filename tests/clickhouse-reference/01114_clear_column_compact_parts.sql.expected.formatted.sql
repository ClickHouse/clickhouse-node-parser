DROP TABLE IF EXISTS clear_column;

CREATE TABLE clear_column
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY x;

INSERT INTO clear_column;

SELECT *
FROM clear_column
ORDER BY x ASC;

DROP TABLE clear_column;