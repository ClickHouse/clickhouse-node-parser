CREATE TABLE qbit_test (id UInt64, vec QBit(Float32, 18)) ENGINE = Memory;
INSERT INTO qbit_test VALUES (1, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]);
SELECT L2DistanceTransposed(vec, NULL, 32) FROM qbit_test;
