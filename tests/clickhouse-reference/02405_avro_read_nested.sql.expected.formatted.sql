-- Tags: no-fasttest, no-parallel
SET flatten_nested = 1;

SELECT *
FROM file(`02405_data`.avro, auto, 'nested Nested(x UInt32, y String)');

SELECT *
FROM file(`02405_data`.avro, auto, 'nested Nested(x UInt32, y Tuple(y1 UInt32, y2 Array(String)), z Nested(z1 UInt32, z2 String))');