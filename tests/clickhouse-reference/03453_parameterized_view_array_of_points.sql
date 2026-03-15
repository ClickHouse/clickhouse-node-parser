CREATE TABLE point_test
(
    `name` String,
    `coord` Point
)
ENGINE = Memory;
CREATE VIEW point_test_parameterized AS
SELECT *
FROM point_test
WHERE coord = {point:Point};
SELECT *
FROM point_test_parameterized(point = (0, 0));
CREATE VIEW point_test_parameterized2 AS
SELECT *
FROM point_test
WHERE coord IN {point:Array(Point)};
SELECT *
FROM point_test_parameterized2(point = [(0, 0)]);
