CREATE TABLE qbit (id UInt32, vec QBit(BFloat16, 3)) ENGINE = Memory;
CREATE TABLE qbit (id UInt32, vec QBit(Float32, 3)) ENGINE = Memory;
CREATE TABLE qbit (id UInt32, vec QBit(Float64, 3)) ENGINE = Memory;
-- Check that constant FixedString columns are supported
SELECT round(L2DistanceTransposed(''::FixedString(1), 3, [1,2,3]::Array(Float32)), 5); -- useDefaultImplementationForConstants is triggered
SELECT round(L2DistanceTransposed(''::FixedString(1), 3, materialize([1,2,3])::Array(Float32)), 5);
