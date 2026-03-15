CREATE TABLE t_point_in_polygon
(
    a UInt64,
    p Point
)
ENGINE = MergeTree
ORDER BY a;

SELECT *
FROM t_point_in_polygon
WHERE pointInPolygon(p, [(0, 0), (10, 0), (10, 10), (0, 10)]);