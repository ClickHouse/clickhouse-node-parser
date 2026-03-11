SELECT  count(abs(toUnixTimestamp(ts, 'UTC') - toUnixTimestamp('2023-05-04 22:17:23', 'UTC')) AS error) FROM t WHERE error < 3600;
