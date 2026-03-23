SELECT SVG((0., 0.));

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)]);

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]]);

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]]);

SELECT SVG((0., 0.), 'b');

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)], 'b');

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], 'b');

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]], 'b');

DROP TABLE IF EXISTS geo;

CREATE TABLE geo
(
    p Tuple(Float64, Float64),
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT SVG(p)
FROM geo
ORDER BY id ASC;

SELECT SVG(p, 'b')
FROM geo
ORDER BY id ASC;

SELECT SVG((0., 0.), s)
FROM geo
ORDER BY id ASC;

SELECT SVG(p, s)
FROM geo
ORDER BY id ASC;

CREATE TABLE geo
(
    p Array(Tuple(Float64, Float64)),
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT SVG([(0., 0.), (10, 0), (10, 10), (0, 10)], s)
FROM geo
ORDER BY id ASC;

CREATE TABLE geo
(
    p Array(Array(Tuple(Float64, Float64))),
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT SVG([[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], s)
FROM geo
ORDER BY id ASC;

CREATE TABLE geo
(
    p Array(Array(Array(Tuple(Float64, Float64)))),
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT SVG([[[(0., 0.), (10, 0), (10, 10), (0, 10)], [(4., 4.), (5, 4), (5, 5), (4, 5)]], [[(-10., -10.), (-10, -9), (-9, 10)]]], s)
FROM geo
ORDER BY id ASC;

DROP TABLE geo;