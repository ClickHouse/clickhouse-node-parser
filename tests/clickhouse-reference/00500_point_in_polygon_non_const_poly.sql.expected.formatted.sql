SELECT 'Const point; No holes';

CREATE TABLE polygons
(
    id Int32,
    poly Array(Tuple(Int32, Int32))
)
ENGINE = Log();

INSERT INTO polygons;

SELECT pointInPolygon((-9, 0), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((0, -9), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((-4, -4), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((0, 0), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((4, 4), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((9, 9), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((9, 4), poly)
FROM polygons
ORDER BY id ASC;

SELECT pointInPolygon((4, 9), poly)
FROM polygons
ORDER BY id ASC;

SELECT 'Non-const point; No holes';

CREATE TABLE polygons
(
    id Int32,
    pt Tuple(Int32, Int32),
    poly Array(Tuple(Int32, Int32))
)
ENGINE = Log();

INSERT INTO polygons;

SELECT pointInPolygon(pt, poly)
FROM polygons
ORDER BY id ASC;

CREATE TABLE polygons
(
    id Int32,
    poly Array(Array(Tuple(Int32, Int32)))
)
ENGINE = Log();

INSERT INTO polygons;

CREATE TABLE polygons
(
    id Int32,
    pt Tuple(Int32, Int32),
    poly Array(Array(Tuple(Int32, Int32)))
)
ENGINE = Log();

INSERT INTO polygons;

CREATE TABLE polygons
(
    id Int32,
    pt Tuple(Int32, Int32),
    poly Array(Array(Array(Tuple(Int32, Int32))))
)
ENGINE = Log();

INSERT INTO polygons;

CREATE TABLE polygons
(
    id Int32,
    pt Tuple(Int32, Int32),
    poly Array(Array(Array(Tuple(Int32, Int32))))
)
ENGINE = Log();

INSERT INTO polygons;