-- Tags: no-fasttest, no-parallel

set flatten_nested = 1;
select * from file(02405_data.avro, auto, 'nested Nested(x UInt32, y String)');
select * from file(02405_data.avro, auto, 'nested Nested(x UInt32, y Tuple(y1 UInt32, y2 Array(String)), z Nested(z1 UInt32, z2 String))');
