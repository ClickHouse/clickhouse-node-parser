select * from t where i < 5 and j in (1, 2);
select count() from (select fromUnixTimestamp64Milli(time, 'UTC') time_fmt, name from test where time_fmt > '2022-09-05 00:00:00');
