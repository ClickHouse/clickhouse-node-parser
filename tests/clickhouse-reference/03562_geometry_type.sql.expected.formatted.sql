SELECT count(*)
FROM geom1;

SELECT readWkt(geom)
FROM geo
ORDER BY id ASC;

SELECT readWKB(s)
FROM geo
ORDER BY id ASC;