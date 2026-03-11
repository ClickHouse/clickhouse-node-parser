SELECT 'Map(Nothing, ...) is non-comparable --> not usable as primary key';

SELECT *
FROM tab
ORDER BY
    m1 ASC,
    m2 ASC;