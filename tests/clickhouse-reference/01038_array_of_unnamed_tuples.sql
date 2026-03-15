SET send_logs_level = 'fatal';
CREATE TABLE array_of_tuples 
(
    f Array(Tuple(Float64, Float64)), 
    s Array(Tuple(UInt8, UInt16, UInt32))
) ENGINE = Memory;
SELECT f from array_of_tuples;
SELECT s from array_of_tuples;
