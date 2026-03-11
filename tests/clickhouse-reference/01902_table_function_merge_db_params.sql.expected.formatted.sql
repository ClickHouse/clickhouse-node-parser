SELECT
    _database,
    _table,
    n
FROM merge(REGEXP('^01902_db_params'), '^t')
ORDER BY
    _database ASC,
    _table ASC,
    n ASC;

SELECT
    _database,
    _table,
    n
FROM merge()
ORDER BY
    _database ASC,
    _table ASC,
    n ASC;

SELECT
    _database,
    _table,
    n
FROM merge('^t')
ORDER BY
    _database ASC,
    _table ASC,
    n ASC;