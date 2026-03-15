CREATE TABLE tbl
(
    s String,
    i int
)
ENGINE = MergeTree
ORDER BY i;

CREATE ROW POLICY filter ON tbl USING 0 TO ALL;

SET max_rows_to_read = 0;

SELECT *
FROM tbl;