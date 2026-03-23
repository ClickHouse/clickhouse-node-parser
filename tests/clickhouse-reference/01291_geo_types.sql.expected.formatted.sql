SYSTEM DROP  TABLE IF EXISTS geo;

CREATE TABLE geo
(
    a Point,
    b Ring,
    c Polygon,
    d MultiPolygon
)
ENGINE = Memory();

INSERT INTO geo;

SELECT *
FROM geo;

SYSTEM DROP  TABLE geo;