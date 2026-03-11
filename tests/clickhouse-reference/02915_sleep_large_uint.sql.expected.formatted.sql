SELECT sleep(3.40282e+44);

SELECT sleep((pow(2, 64) / 1000000) - 1);

SELECT sleepEachRow(184467440737095516)
FROM numbers(10000);

SELECT sleepEachRow(pow(2, 31))
FROM numbers(9007199254740992)
SETTINGS function_sleep_max_microseconds_per_block = 8589934592000000000;