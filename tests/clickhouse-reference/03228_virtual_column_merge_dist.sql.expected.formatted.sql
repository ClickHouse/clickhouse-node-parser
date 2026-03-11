SELECT
    a,
    _table
FROM t_merge
ORDER BY a ASC;

SELECT
    a,
    _table
FROM t_distr
ORDER BY a ASC;

SELECT
    a,
    _database = currentDatabase()
FROM t_merge
ORDER BY a ASC;

SELECT
    a,
    _database = currentDatabase()
FROM t_distr
ORDER BY a ASC;