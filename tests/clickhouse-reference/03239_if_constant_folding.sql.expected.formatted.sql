SELECT
    if(false, c, '') AS c,
    count()
FROM (
        SELECT '' AS c
    )
GROUP BY c;

SELECT
    if(0, c, '') AS _c,
    count()
FROM (
        SELECT '' AS c
    )
GROUP BY _c;

SELECT
    if(1 = 0, c, '') AS _c,
    count()
FROM (
        SELECT '' AS c
    )
GROUP BY _c;

SELECT
    if(materialize(false), c, 'x') AS c,
    count()
FROM (
        SELECT 'o' AS c
    )
GROUP BY c;

SELECT
    if(1 = 1, c, '') AS _c,
    count()
FROM (
        SELECT '' AS c
    )
GROUP BY _c;