SELECT
    *,
    _table
FROM merge(currentDatabase(), '')
ORDER BY
    _table ASC,
    tuple(*) ASC;

SELECT 0;

SELECT *
FROM rmt3
ORDER BY n ASC;