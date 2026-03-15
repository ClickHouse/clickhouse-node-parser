SELECT pointInPolygon((0, 0), [[(0, 0), (10, 0), (10, 10), (0, 10)]]);
CREATE TABLE s (`id` String, `lng` Int64, `lat` Int64) ENGINE = Memory();
CREATE TABLE p (`polygon_id` Int64, `polygon_name` String, `shape` Array(Array(Tuple(Float64, Float64))), `state` String) ENGINE = Memory();
SELECT id FROM s WHERE pointInPolygon((lng,lat), (select shape from p where polygon_id = 8));
