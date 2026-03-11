SELECT parseTimeDelta('1 min 35 sec');

SELECT parseTimeDelta('0m;11.23s.');

SELECT parseTimeDelta('11hr 25min 3.1s');

SELECT parseTimeDelta('0.00123 seconds');

SELECT parseTimeDelta('1yr2mo');

SELECT parseTimeDelta('11s+22min');

SELECT parseTimeDelta('1yr-2mo-4w + 12 days, 3 hours : 1 minute ; 33 seconds');

SELECT parseTimeDelta('1s1ms1us1ns');

SELECT parseTimeDelta('1s1ms1μs1ns');

SELECT parseTimeDelta('1s1ms1µs1ns');

SELECT parseTimeDelta('1s - 1ms : 1μs ; 1ns');

SELECT parseTimeDelta('1.11s1.11ms1.11us1.11ns');

SELECT parseTimeDelta();

SELECT parseTimeDelta('1yr', 1);

SELECT parseTimeDelta(1);

SELECT parseTimeDelta(' ');

SELECT parseTimeDelta('-1yr');

SELECT parseTimeDelta('1yr-');

SELECT parseTimeDelta('yr2mo');

SELECT parseTimeDelta('1.yr2mo');

SELECT parseTimeDelta('1-yr');

SELECT parseTimeDelta('1 1yr');

SELECT parseTimeDelta('1yyr');