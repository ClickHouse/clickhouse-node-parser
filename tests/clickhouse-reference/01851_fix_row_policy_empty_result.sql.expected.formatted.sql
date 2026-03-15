CREATE TABLE tbl
(
    s String,
    i int
)
ENGINE = MergeTree
ORDER BY i;

CREATE ROW POLICY filter ON tbl USING (s = 'non_existing_domain') TO ALL;

SELECT *
FROM tbl
PREWHERE s = '123'
WHERE i = 123;