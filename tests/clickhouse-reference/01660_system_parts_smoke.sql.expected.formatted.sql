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

SELECT *
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data_01660';