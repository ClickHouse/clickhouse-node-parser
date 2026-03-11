SELECT roundBankers(welchTTest(left, right).2, 6) from welch_ttest__fuzz_7;
SELECT roundBankers(studentTTest(left, right).2, 6) from welch_ttest__fuzz_7;
