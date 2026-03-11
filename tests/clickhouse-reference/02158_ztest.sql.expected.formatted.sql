SELECT
    roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).1, 16) AS z_stat,
    roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).2, 16) AS p_value,
    roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).3, 16) AS ci_low,
    roundBankers(meanZTest(833.0, 800.0, 0.95)(v, s).4, 16) AS ci_high
FROM mean_ztest;