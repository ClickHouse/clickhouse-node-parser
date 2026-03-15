CREATE TABLE mann_whitney_test
(
    `left` Float64,
    `right` UInt8
)
ENGINE = Memory;

SELECT mannWhitneyUTest(`left`, `right`)
FROM mann_whitney_test;

SELECT
    '223.0',
    '0.5426959774289482';