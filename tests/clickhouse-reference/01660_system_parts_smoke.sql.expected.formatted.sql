-- There is different code path when:
-- - _state is not requested
-- - _state is requested
-- - only _state is requested
SELECT *
FROM `system`.parts
FORMAT Null;

SELECT
    *,
    _state
FROM `system`.parts
FORMAT Null;

SELECT _state
FROM `system`.parts
FORMAT Null;

-- Create one table and see some columns in system.parts
SYSTEM DROP  TABLE IF EXISTS data_01660;

CREATE TABLE data_01660
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

-- Empty
SELECT _state
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660';

SELECT
    name,
    _state
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660';

SELECT
    name,
    active
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660';

INSERT INTO data_01660;

INSERT INTO data_01660;

SELECT
    name,
    _state
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660'
ORDER BY name ASC;

SELECT
    name,
    active
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660'
ORDER BY name ASC;

SELECT
    count(),
    _state
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660'
GROUP BY _state
ORDER BY _state ASC;

SELECT
    if(count() > 0, 'HAVE PARTS', 'NO PARTS'),
    _state
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660'
GROUP BY _state
ORDER BY _state ASC;

SYSTEM DROP  TABLE data_01660;

SELECT *
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660';