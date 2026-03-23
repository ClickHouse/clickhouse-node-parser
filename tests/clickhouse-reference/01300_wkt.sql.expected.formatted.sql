SELECT wkt((0., 0.));

SELECT wkt([(0., 0.), (10., 0.), (10., 10.), (0., 10.)]);

SELECT wkt([[(0., 0.), (10., 0.), (10., 10.), (0., 10.)], [(4., 4.), (5., 4.), (5., 5.), (4., 5.)]]);

SELECT wkt([[[(0., 0.), (10., 0.), (10., 10.), (0., 10.)], [(4., 4.), (5., 4.), (5., 5.), (4., 5.)]], [[(-10., -10.), (-10., -9.), (-9., 10.)]]]);

DROP TABLE IF EXISTS geo;

CREATE TABLE geo
(
    p Tuple(Float64, Float64),
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT wkt(p)
FROM geo
ORDER BY id ASC;

CREATE TABLE geo
(
    p Array(Tuple(Float64, Float64)),
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

CREATE TABLE geo
(
    p Array(Array(Tuple(Float64, Float64))),
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

CREATE TABLE geo
(
    p Array(Array(Array(Tuple(Float64, Float64)))),
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

DROP TABLE geo;