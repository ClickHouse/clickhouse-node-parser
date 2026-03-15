SET send_logs_level = 'fatal';

CREATE TABLE array_of_tuples
(
    f Array(Tuple(Float64, Float64)),
    s Array(Tuple(UInt8, UInt16, UInt32))
)
ENGINE = Memory;

SELECT f
FROM array_of_tuples;

SELECT s
FROM array_of_tuples;