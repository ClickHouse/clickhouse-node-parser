DROP TABLE IF EXISTS tbl;

CREATE TABLE tbl
(
    s String,
    i int
)
ENGINE = MergeTree
ORDER BY i;

INSERT INTO tbl;

drop row policy if exists filter on tbl;

CREATE ROW POLICY filter ON tbl USING 0 TO ALL;

SET max_rows_to_read = 0;

SELECT *
FROM tbl;

drop row policy filter on tbl;

DROP TABLE tbl;