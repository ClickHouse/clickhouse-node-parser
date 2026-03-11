SELECT JSONExtract('{"v":1.1}', 'v', 'UInt64');

SELECT JSONExtract('{"v":1.1}', 'v', 'Nullable(UInt64)');

SELECT JSONExtract('{"v":-1e300}', 'v', 'Float64');

SELECT JSONExtract('{"v":-1e300}', 'v', 'Float32');

SELECT JSONExtract('{"v":-1e300}', 'v', 'UInt64');

SELECT JSONExtract('{"v":-1e300}', 'v', 'Int64');

SELECT JSONExtract('{"v":-1e300}', 'v', 'UInt8');

SELECT JSONExtract('{"v":-1e300}', 'v', 'Int8');