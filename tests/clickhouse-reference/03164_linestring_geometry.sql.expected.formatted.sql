SELECT readWKTLineString('LINESTRING (1 1, 2 2, 3 3, 1 1)');

SELECT toTypeName(readWKTLineString('LINESTRING (1 1, 2 2, 3 3, 1 1)'));

SELECT wkt(readWKTLineString('LINESTRING (1 1, 2 2, 3 3, 1 1)'));