SELECT count()
FROM merge(currentDatabase(), '^numbers\\d+$')
WHERE _table = 'numbers1'; -- { serverError TYPE_MISMATCH }

SELECT count()
FROM merge(currentDatabase(), '^numbers\\d+$')
WHERE _table = 1;