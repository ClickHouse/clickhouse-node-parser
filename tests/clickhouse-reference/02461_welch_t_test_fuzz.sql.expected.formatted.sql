CREATE TABLE welch_ttest__fuzz_7
(
    `left` UInt128,
    `right` UInt128
)
ENGINE = Memory;

SELECT roundBankers(welchTTest(`left`, `right`).2, 6)
FROM welch_ttest__fuzz_7;

SELECT roundBankers(studentTTest(`left`, `right`).2, 6)
FROM welch_ttest__fuzz_7;