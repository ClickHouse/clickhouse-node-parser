SYSTEM drop  table if exists tbl;

CREATE TABLE tbl
(
    s String,
    i int
)
ENGINE = MergeTree
ORDER BY i;

INSERT INTO tbl;

SYSTEM drop  row policy if exists filter on tbl;

CREATE ROW POLICY filter ON tbl USING 0 TO ALL;

SET max_rows_to_read = 0;

SELECT *
FROM tbl;

SYSTEM drop  row policy filter on tbl;

SYSTEM drop  table tbl;