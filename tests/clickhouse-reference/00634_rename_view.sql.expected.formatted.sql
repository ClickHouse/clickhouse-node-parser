CREATE TABLE test1_00634
(
    id UInt8
)
ENGINE = TinyLog;

CREATE TABLE test2_00634
(
    id UInt8
)
ENGINE = TinyLog;

CREATE VIEW v_test1
AS
SELECT id
FROM test1_00634;

CREATE VIEW v_test2
AS
SELECT id
FROM test2_00634;

SELECT
    name,
    engine
FROM `system`.tables
WHERE name IN ('v_test1', 'v_test2', 'v_test11', 'v_test22')
    AND database = currentDatabase()
ORDER BY name ASC;