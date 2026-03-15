CREATE TABLE IF NOT EXISTS geom1
(
    a Point
)
ENGINE = Memory();

SELECT hex(wkb(a))
FROM geom1
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom2
(
    a LineString
)
ENGINE = Memory();

SELECT hex(wkb(a))
FROM geom2
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom3
(
    a Polygon
)
ENGINE = Memory();

SELECT hex(wkb(a))
FROM geom3
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom4
(
    a MultiLineString
)
ENGINE = Memory();

SELECT hex(wkb(a))
FROM geom4
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom5
(
    a MultiPolygon
)
ENGINE = Memory();

SELECT hex(wkb(a))
FROM geom5
ORDER BY `ALL` ASC;