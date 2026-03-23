-- Tags: no-replicated-database
-- Tag no-replicated-database: Does not support renaming of multiple tables in single query
SYSTEM DROP  TABLE IF EXISTS test1_00634;

SYSTEM DROP  TABLE IF EXISTS test2_00634;

SYSTEM DROP  TABLE IF EXISTS v_test1;

SYSTEM DROP  TABLE IF EXISTS v_test2;

SYSTEM DROP  TABLE IF EXISTS v_test11;

SYSTEM DROP  TABLE IF EXISTS v_test22;

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

SYSTEM DROP  TABLE test1_00634;

SYSTEM DROP  TABLE test2_00634;

SYSTEM DROP  TABLE v_test11;

SYSTEM DROP  TABLE v_test22;