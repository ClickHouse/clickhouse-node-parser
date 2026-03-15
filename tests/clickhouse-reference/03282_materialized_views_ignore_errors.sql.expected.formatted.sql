-- more blocks to process
SET max_block_size = 10;

SET min_insert_block_size_rows = 10;

CREATE TABLE testX
(
    A Int64
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (intDiv(A, 10), throwIf(A=2));

CREATE MATERIALIZED VIEW testXA
ENGINE = MergeTree
ORDER BY tuple()
AS
SELECT sleep(0.1)
FROM testX;

SELECT count()
FROM testX;

SELECT count()
FROM testXA;