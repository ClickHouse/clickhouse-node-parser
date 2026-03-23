CREATE TABLE IF NOT EXISTS geom1
(
    a Point
)
ENGINE = Memory();

INSERT INTO geom1;

INSERT INTO geom1;

INSERT INTO geom1;

SELECT hex(wkb(a))
FROM geom1
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom2
(
    a LineString
)
ENGINE = Memory();

INSERT INTO geom2;

INSERT INTO geom2;

SELECT hex(wkb(a))
FROM geom2
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom3
(
    a Polygon
)
ENGINE = Memory();

INSERT INTO geom3;

INSERT INTO geom3;

SELECT hex(wkb(a))
FROM geom3
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom4
(
    a MultiLineString
)
ENGINE = Memory();

INSERT INTO geom4;

INSERT INTO geom4;

SELECT hex(wkb(a))
FROM geom4
ORDER BY `ALL` ASC;

CREATE TABLE IF NOT EXISTS geom5
(
    a MultiPolygon
)
ENGINE = Memory();

INSERT INTO geom5;

INSERT INTO geom5;

SELECT hex(wkb(a))
FROM geom5
ORDER BY `ALL` ASC;