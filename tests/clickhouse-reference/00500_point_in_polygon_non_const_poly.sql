SELECT 'Const point; No holes';
create table polygons ( id Int32, poly Array(Tuple(Int32, Int32))) engine = Log();
SELECT pointInPolygon((-9, 0), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((0, -9), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((-4, -4), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((0, 0), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((4, 4), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((9, 9), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((9, 4), poly) FROM polygons ORDER BY id;
SELECT pointInPolygon((4, 9), poly) FROM polygons ORDER BY id;
SELECT 'Non-const point; No holes';
create table polygons ( id Int32, pt Tuple(Int32, Int32), poly Array(Tuple(Int32, Int32))) engine = Log();
SELECT pointInPolygon(pt, poly) FROM polygons ORDER BY id;
create table polygons ( id Int32, poly Array(Array(Tuple(Int32, Int32)))) engine = Log();
create table polygons ( id Int32, pt Tuple(Int32, Int32), poly Array(Array(Tuple(Int32, Int32)))) engine = Log();
create table polygons ( id Int32, pt Tuple(Int32, Int32), poly Array(Array(Array(Tuple(Int32, Int32))))) engine = Log();
create table polygons
(
    id   Int32,
    pt   Tuple(Int32, Int32),
    poly Array(Array(Array(Tuple(Int32, Int32))))
) engine = Log();
