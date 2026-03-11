SELECT
    s.site AS site,
    if((a.order IS NULL) OR (a.order <= 0) OR (a.order > 30), NULL, accurateCastOrNull(a.order, 'Int32')) AS page_level,
    count() AS count
FROM AddedToCart AS a
ANY LEFT JOIN Session AS s ON a.sessionId = s.id
WHERE (a.top IS NOT NULL)
  AND (a.screenHeight IS NOT NULL)
  AND (a.screenHeight > 0)
  AND (a.isPromotion = _CAST(1, 'UInt8'))
  AND (s.device = 'DESKTOP')
  AND isNotNull(s.site)
GROUP BY site, page_level
ORDER BY site ASC, page_level ASC
FORMAT JSONEachRow;
