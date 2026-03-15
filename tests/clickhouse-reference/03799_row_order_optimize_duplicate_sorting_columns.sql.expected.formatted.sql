CREATE TABLE t0
(
    c0 Int,
    PROJECTION p0 (    SELECT c0
    GROUP BY
        c0,
        c0)
)
ENGINE = MergeTree()
PRIMARY KEY tuple()
SETTINGS optimize_row_order = 1, allow_suspicious_indices = 1;

SELECT *
FROM t0
ORDER BY `ALL` ASC;