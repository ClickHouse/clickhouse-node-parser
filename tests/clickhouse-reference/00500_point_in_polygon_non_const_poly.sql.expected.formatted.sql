SELECT 'Const point; No holes';

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

SELECT pointInPolygon(pt, poly)
FROM polygons
ORDER BY id ASC;