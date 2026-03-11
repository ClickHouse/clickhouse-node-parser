SELECT pointInPolygon((0, 0), [[(0, 0), (10, 0), (10, 10), (0, 10)]]);
SELECT id FROM s WHERE pointInPolygon((lng,lat), (select shape from p where polygon_id = 8));
