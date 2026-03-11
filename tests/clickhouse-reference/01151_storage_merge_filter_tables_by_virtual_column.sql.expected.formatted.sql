SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table');

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE _table IN ('src_table_2', 'src_table_3');

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE _table IN ('src_table_2', 'src_table_3')
    AND n % 20 = 0;

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE _table IN (`set`);

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE _table IN (tmp);

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE _table IN (`set`)
    AND n % 2 = 0;

SELECT
    count(),
    sum(n)
FROM merge(currentDatabase(), 'src_table')
WHERE n % 2 = 0
    AND _table IN (tmp);