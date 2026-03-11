SELECT
    'from dst',
    *,
    _part
FROM dst
ORDER BY `all` ASC;

SELECT
    'from mv_dst',
    *,
    _part
FROM mv_dst
ORDER BY `all` ASC;