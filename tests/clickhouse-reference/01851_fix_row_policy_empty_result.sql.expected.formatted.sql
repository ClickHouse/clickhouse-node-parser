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

CREATE ROW POLICY filter ON tbl USING (s = 'non_existing_domain') TO ALL;

SELECT *
FROM tbl
PREWHERE s = '123'
WHERE i = 123;

drop row policy filter on tbl;

DROP TABLE tbl;