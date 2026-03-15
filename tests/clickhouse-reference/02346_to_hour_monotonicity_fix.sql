create table test_tz_hour(t DateTime, x String) engine MergeTree partition by toYYYYMMDD(t) order by x;
select toHour(toTimeZone(t, 'UTC')) as toHour_UTC, toHour(toTimeZone(t, 'Asia/Jerusalem')) as toHour_Israel, count() from test_tz_hour where toHour_Israel = 8 group by toHour_UTC, toHour_Israel;
