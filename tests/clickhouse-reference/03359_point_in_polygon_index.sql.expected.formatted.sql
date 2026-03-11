SELECT *
FROM t_point_in_polygon
WHERE pointInPolygon(p, [(0, 0), (10, 0), (10, 10), (0, 10)]);