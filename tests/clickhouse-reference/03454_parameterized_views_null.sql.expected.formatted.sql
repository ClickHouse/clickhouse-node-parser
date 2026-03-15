SET enable_analyzer = 1;

CREATE VIEW test_table
AS
SELECT *
FROM `system`.one
WHERE dummy = isNull({param:Nullable(Int64)});

SELECT *
FROM test_table(param = NULL);