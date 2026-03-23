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

CREATE ROW POLICY filter ON tbl USING (s = 'non_existing_domain') TO ALL;

SELECT *
FROM tbl
PREWHERE s = '123'
WHERE i = 123;

SYSTEM drop  row policy filter on tbl;

SYSTEM drop  table tbl;