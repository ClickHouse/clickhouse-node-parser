DROP TABLE IF EXISTS geom1;

CREATE TABLE IF NOT EXISTS geom1
(
    geom Geometry
)
ENGINE = Memory();

INSERT INTO geom1;

INSERT INTO geom1;

INSERT INTO geom1;

INSERT INTO geom1;

SELECT count(*)
FROM geom1;

DROP TABLE IF EXISTS geo;

CREATE TABLE IF NOT EXISTS geo
(
    geom String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT readWkt(geom)
FROM geo
ORDER BY id ASC;

CREATE TABLE geo
(
    s String,
    id Int
)
ENGINE = Memory();

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

INSERT INTO geo;

SELECT readWKB(s)
FROM geo
ORDER BY id ASC;