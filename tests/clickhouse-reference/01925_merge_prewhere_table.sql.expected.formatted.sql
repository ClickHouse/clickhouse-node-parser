SELECT
    _table,
    count()
FROM x
GROUP BY _table
ORDER BY _table ASC;