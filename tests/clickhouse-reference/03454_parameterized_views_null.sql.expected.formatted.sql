SET enable_analyzer = 1;

DROP TABLE IF EXISTS test_table;

CREATE VIEW test_table
AS
SELECT *
FROM `system`.one
WHERE dummy = isNull({param:Nullable(Int64)});

SELECT *
FROM test_table(param = NULL);

DROP TABLE test_table;