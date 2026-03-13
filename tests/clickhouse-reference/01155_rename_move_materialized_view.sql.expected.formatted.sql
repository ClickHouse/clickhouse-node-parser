-- FIXME Cannot convert column `1` because it is non constant in source stream but must be constant in result
SELECT *
FROM (
        SELECT
            materialize(1),
            substr(_table, 1, 10) AS _table,
            s
        FROM merge('test_01155_ordinary', '')
    )
ORDER BY
    _table ASC,
    s ASC;

SELECT dictGet('test_01155_ordinary.dict', 'x', 'before moving tables');

SELECT dictGet('test_01155_ordinary.dict1', 'x', 'before moving tables');

SELECT
    database,
    name,
    uuid
FROM `system`.dictionaries
WHERE database = 'test_01155_ordinary';

SELECT substr(name, 1, 10)
FROM `system`.tables
WHERE database = 'test_01155_ordinary';

SELECT substr(name, 1, 10)
FROM `system`.tables
WHERE database = 'test_01155_atomic';

SELECT
    materialize(2),
    substr(_table, 1, 10),
    s
FROM merge('test_01155_atomic', '')
ORDER BY
    _table ASC,
    s ASC; -- { serverError UNKNOWN_DATABASE }

SELECT dictGet('test_01155_ordinary.dict', 'x', 'after moving tables'); -- { serverError BAD_ARGUMENTS }

SELECT *
FROM (
        SELECT
            materialize(3),
            substr(_table, 1, 10) AS _table,
            s
        FROM merge('test_01155_ordinary', '')
    )
ORDER BY
    _table ASC,
    s ASC;

SELECT dictGet('test_01155_ordinary.dict', 'x', 'after renaming database');

SELECT
    database,
    substr(name, 1, 10)
FROM `system`.tables
WHERE like(database, 'test_01155_%');

SELECT *
FROM (
        SELECT
            materialize(4),
            substr(_table, 1, 10) AS _table,
            s
        FROM merge('test_01155_ordinary', '')
    )
ORDER BY
    _table ASC,
    s ASC;

SELECT dictGet('test_01155_ordinary.dict', 'x', 'after renaming tables');