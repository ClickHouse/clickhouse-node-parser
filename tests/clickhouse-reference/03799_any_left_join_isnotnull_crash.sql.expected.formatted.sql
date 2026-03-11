SELECT
    s.site AS site,
    if((isNull(a.`order`))
    OR (a.`order` <= 0)
    OR (a.`order` > 30), NULL, accurateCastOrNull(a.`order`, 'Int32')) AS page_level,
    count() AS count
FROM
    AddedToCart AS a
LEFT JOIN Session AS s
    ON a.sessionId = s.id
WHERE (isNotNull(a.`top`))
    AND (isNotNull(a.screenHeight))
    AND (a.screenHeight > 0)
    AND (a.isPromotion = _CAST(1, 'UInt8'))
    AND (s.device = 'DESKTOP')
    AND isNotNull(s.site)
GROUP BY
    site,
    page_level
ORDER BY
    site ASC,
    page_level ASC
FORMAT JSONEachRow;