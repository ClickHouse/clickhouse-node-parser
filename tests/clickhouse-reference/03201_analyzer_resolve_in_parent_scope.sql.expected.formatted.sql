CREATE VIEW fake
AS
SELECT
    table,
    database,
    name
FROM `system`.tables
WHERE database = currentDatabase();

CREATE VIEW another_fake
AS
SELECT
    bytes,
    table
FROM `system`.parts;

CREATE TABLE test
(
    a UInt64,
    b UInt64,
    Block_Height UInt64,
    Block_Date Date
)
ENGINE = Log;

CREATE TABLE test_cte
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY tuple();