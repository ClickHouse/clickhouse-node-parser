CREATE TABLE `03199_fixedstring_array`
(
    arr Array(LowCardinality(FixedString(8)))
)
ENGINE = Memory;

SELECT has(arr, toFixedString(materialize('a'), 1))
FROM `03199_fixedstring_array`;