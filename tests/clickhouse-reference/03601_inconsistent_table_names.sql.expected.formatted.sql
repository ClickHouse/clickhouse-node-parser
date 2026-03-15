-- https://github.com/ClickHouse/ClickHouse/issues/70826
SET enable_analyzer = 1;

CREATE VIEW v0
AS
SELECT 1 AS c0
FROM
    (
        SELECT 1
    ) AS w
CROSS JOIN (
        SELECT 1
    ) AS z;