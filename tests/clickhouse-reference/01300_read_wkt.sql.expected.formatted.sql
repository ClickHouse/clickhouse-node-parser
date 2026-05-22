SELECT readWKTPoint('POINT(0 0)');

SELECT readWKTPolygon('POLYGON((1 0,10 0,10 10,0 10,1 0))');

SELECT readWKTPolygon('POLYGON((0 0,10 0,10 10,0 10,0 0),(4 4,5 4,5 5,4 5,4 4))');

SELECT readWKTMultiPolygon('MULTIPOLYGON(((2 0,10 0,10 10,0 10,2 0),(4 4,5 4,5 5,4 5,4 4)),((-10 -10,-10 -9,-9 10,-10 -10)))');

DROP TABLE IF EXISTS geo;

CREATE TABLE geo
(
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT readWKTPoint(s)
FROM geo
ORDER BY id ASC;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT readWKTPolygon(s)
FROM geo
ORDER BY id ASC;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT readWKTMultiPolygon(s)
FROM geo
ORDER BY id ASC;

DROP TABLE geo;