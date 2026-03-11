SELECT pointInPolygon((0, 0), [[(0, 0), (10, 0), (10, 10), (0, 10)]]);

SELECT id
FROM s
WHERE pointInPolygon((lng,lat), (
        SELECT shape
        FROM p
        WHERE polygon_id = 8
    ));