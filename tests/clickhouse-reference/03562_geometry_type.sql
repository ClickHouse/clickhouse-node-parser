CREATE TABLE IF NOT EXISTS geom1 (geom Geometry) ENGINE = Memory();
SELECT count(*) FROM geom1;
CREATE TABLE IF NOT EXISTS geo (geom String, id Int) ENGINE = Memory();
SELECT readWkt(geom) FROM geo ORDER BY id;
CREATE TABLE geo (s String, id Int) engine=Memory();
SELECT readWKB(s) FROM geo ORDER BY id;
