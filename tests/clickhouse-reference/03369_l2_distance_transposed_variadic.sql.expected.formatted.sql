-- Check that constant FixedString columns are supported
SELECT round(L2DistanceTransposed(''::FixedString(1), 3, [1,2,3]::Array(Float32)), 5); -- useDefaultImplementationForConstants is triggered

SELECT round(L2DistanceTransposed(''::FixedString(1), 3, materialize([1,2,3])::Array(Float32)), 5);