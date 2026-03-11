SELECT roundBankers(welchTTest(`left`, `right`).2, 6)
FROM welch_ttest;

SELECT
    '-0.5028215369186904',
    '0.6152361677168877';

SELECT
    roundBankers(welchTTest(`left`, `right`).1, 6) AS t_stat,
    roundBankers(welchTTest(`left`, `right`).2, 6) AS p_value
FROM welch_ttest;

SELECT
    '14.971190998235835',
    '5.898143508382202e-44';

SELECT
    roundBankers(welchTTest(0.95)(`left`, `right`).3, 6) AS t_stat,
    roundBankers(welchTTest(0.95)(`left`, `right`).4, 6) AS p_value
FROM welch_ttest;

SELECT
    '-2.610898982580138',
    '0.00916587538237954';

SELECT
    roundBankers(studentTTest(`left`, `right`).1, 6) AS t_stat,
    roundBankers(studentTTest(`left`, `right`).2, 6) AS p_value
FROM student_ttest;

SELECT
    '-28.740781574102936',
    '7.667329672103986e-133';

SELECT
    roundBankers(studentTTest(0.95)(`left`, `right`).3, 6) AS t_stat,
    roundBankers(studentTTest(0.95)(`left`, `right`).4, 6) AS p_value
FROM student_ttest;

SELECT
    '0.376423',
    '0.709342';

SELECT
    roundBankers(studentTTestOneSample(value, 75).1, 6) AS t_stat,
    roundBankers(studentTTestOneSample(value, 75).2, 6) AS p_value
FROM onesample_ttest;