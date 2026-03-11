SELECT *
FROM
    l
FULL JOIN r
    ON l.luid = r.ruid
WHERE isNull(luid)
    AND isNotNull(ruid);

SELECT *
FROM (
        SELECT *
        FROM
            l
        FULL JOIN r
            ON l.luid = r.ruid
    )
WHERE isNull(luid)
    AND isNotNull(ruid);

SELECT *
FROM (
        SELECT *
        FROM
            l
        FULL JOIN r
            ON l.luid = r.ruid
        LIMIT 100000000
    )
WHERE isNull(luid)
    AND isNotNull(ruid);