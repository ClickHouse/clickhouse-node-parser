CREATE TABLE geo
(
    a Point,
    b Ring,
    c Polygon,
    d MultiPolygon
)
ENGINE = Memory();

SELECT *
FROM geo;