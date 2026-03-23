DROP TABLE IF EXISTS tp;

CREATE TABLE tp
(
    x Int32,
    y Int32,
    PROJECTION p (    SELECT
        x,
        y
    ORDER BY x ASC)
)
ENGINE = MergeTree
ORDER BY y;

DROP TABLE tp;