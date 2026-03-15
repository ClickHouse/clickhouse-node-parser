CREATE TABLE test_degs_to_rads (degrees Float64) ENGINE = Memory;
-- test that converting degrees to radians and back preserves the original value
select DEGREES(RADIANS(degrees)) from test_degs_to_rads order by degrees;
-- test that radians func returns correct value for both int and floats
select RADIANS(degrees) from test_degs_to_rads order by degrees;
CREATE TABLE test_rads_to_degs (radians Float64) ENGINE = Memory;
-- test that converting radians to degrees and back preserves the original value
select RADIANS(DEGREES(radians)) from test_rads_to_degs order by radians;
-- test that degrees func returns correct value for both int and floats
select DEGREES(radians) from test_rads_to_degs order by radians;
