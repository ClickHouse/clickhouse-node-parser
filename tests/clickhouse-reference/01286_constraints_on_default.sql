CREATE TABLE default_constraints
(
    x UInt8,
    y UInt8 DEFAULT x + 1,
    CONSTRAINT c CHECK y < 5
) ENGINE = Memory;
SELECT y, throwIf(NOT y < 5) FROM default_constraints;
SELECT count() FROM default_constraints;
CREATE TEMPORARY TABLE default_constraints
(
    x UInt8,
    y UInt8 DEFAULT x + 1,
    CONSTRAINT c CHECK y < 5
);
