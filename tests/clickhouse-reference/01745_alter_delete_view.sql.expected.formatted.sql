CREATE TABLE test_table
(
    f1 Int32,
    f2 Int32,
    pk Int32
)
ENGINE = MergeTree()
ORDER BY f1
PARTITION BY pk;

CREATE VIEW test_view
AS
SELECT
    f1,
    f2
FROM test_table
WHERE pk = 2;

INSERT INTO test_table (f1, f2, pk);

SELECT *
FROM test_view
ORDER BY
    f1 ASC,
    f2 ASC;