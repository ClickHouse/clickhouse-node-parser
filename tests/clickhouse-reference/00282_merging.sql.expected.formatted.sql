SELECT *
FROM merge
ORDER BY
    _part_index ASC,
    x ASC;

SELECT
    count(),
    uniqExact(x),
    min(x),
    max(x),
    sum(x),
    sum(cityHash64(x))
FROM merge;