CREATE TABLE test1_00671(start Integer, end Integer) engine = Memory;
CREATE TABLE test2_00671(start Integer, end Integer) engine = Memory;
SELECT maxIntersections(start,end) from test1_00671;
SELECT maxIntersections(start,end) from test2_00671;
