SELECT changeYear();

SELECT changeYear(toDate('2000-01-01'));

SELECT changeYear(toDate('2000-01-01'), 2000, 1);

SELECT changeYear(1999, 2000);

SELECT changeYear(toDate('2000-01-01'), 'abc');

SELECT changeYear(toDate('2000-01-01'), 1.5);

SELECT '-- Date';

SELECT changeYear(toDate('2000-01-01'), 2001);

SELECT changeYear(toDate('2000-01-01'), 1800);

SELECT changeYear(toDate('2000-01-01'), -5000);

SELECT changeYear(toDate('2000-01-01'), 2500);

SELECT changeYear(toDate32('2000-01-01'), 2001);

SELECT changeYear(toDate32('2000-01-01'), 1800);

SELECT changeYear(toDate32('2000-01-01'), -5000);

SELECT changeYear(toDate32('2000-01-01'), 2500);

SELECT changeYear(toDateTime('2000-01-01 11:22:33'), 2001);

SELECT changeYear(toDateTime('2000-01-01 11:22:33'), 1800);

SELECT changeYear(toDateTime('2000-01-01 11:22:33'), -5000);

SELECT changeYear(toDateTime('2000-01-01 11:22:33'), 2500);

SELECT changeYear(toDateTime64('2000-01-01 11:22:33.4444', 4), 2001);

SELECT changeYear(toDateTime64('2000-01-01 11:22:33.4444', 4), 1800);

SELECT changeYear(toDateTime64('2000-01-01 11:22:33.4444', 4), -5000);

SELECT changeYear(toDateTime64('2000-01-01 11:22:33.4444', 4), 2500);

SELECT changeMonth(toDate('2000-01-01'), 1);

SELECT changeMonth(toDate('2000-01-01'), 2);

SELECT changeMonth(toDate('2000-01-01'), 12);

SELECT changeMonth(toDate('2000-01-01'), 0);

SELECT changeMonth(toDate('2000-01-01'), -1);

SELECT changeMonth(toDate('2000-01-01'), 13);

SELECT changeMonth(toDate32('2000-01-01'), 1);

SELECT changeMonth(toDate32('2000-01-01'), 2);

SELECT changeMonth(toDate32('2000-01-01'), 12);

SELECT changeMonth(toDate32('2000-01-01'), 0);

SELECT changeMonth(toDate32('2000-01-01'), -1);

SELECT changeMonth(toDate32('2000-01-01'), 13);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), 1);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), 2);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), 12);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), 0);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), -1);

SELECT changeMonth(toDateTime('2000-01-01 11:22:33'), 13);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), 1);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), 2);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), 12);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), 0);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), -1);

SELECT changeMonth(toDateTime64('2000-01-01 11:22:33.4444', 4), 13);

SELECT changeDay(toDate('2000-01-01'), 1);

SELECT changeDay(toDate('2000-01-01'), 2);

SELECT changeDay(toDate('2000-01-01'), 31);

SELECT changeDay(toDate('2000-01-01'), 0);

SELECT changeDay(toDate('2000-01-01'), -1);

SELECT changeDay(toDate('2000-01-01'), 32);

SELECT changeDay(toDate32('2000-01-01'), 1);

SELECT changeDay(toDate32('2000-01-01'), 2);

SELECT changeDay(toDate32('2000-01-01'), 31);

SELECT changeDay(toDate32('2000-01-01'), 0);

SELECT changeDay(toDate32('2000-01-01'), -1);

SELECT changeDay(toDate32('2000-01-01'), 32);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), 1);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), 2);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), 31);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), 0);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), -1);

SELECT changeDay(toDateTime('2000-01-01 11:22:33'), 32);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), 1);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), 2);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), 31);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), 0);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), -1);

SELECT changeDay(toDateTime64('2000-01-01 11:22:33.4444', 4), 32);

SELECT changeDay(toDate('2000-02-28'), 29);

SELECT changeDay(toDate32('2000-02-01'), 29);

SELECT changeDay(toDateTime('2000-02-01 11:22:33'), 29);

SELECT changeDay(toDateTime64('2000-02-01 11:22:33.4444', 4), 29);

SELECT changeHour(toDate('2000-01-01'), 0);

SELECT changeHour(toDate('2000-01-01'), 2);

SELECT changeHour(toDate('2000-01-01'), 23);

SELECT changeHour(toDate('2000-01-01'), -1);

SELECT changeHour(toDate('2000-01-01'), 24);

SELECT changeHour(toDate32('2000-01-01'), 0);

SELECT changeHour(toDate32('2000-01-01'), 2);

SELECT changeHour(toDate32('2000-01-01'), 23);

SELECT changeHour(toDate32('2000-01-01'), -1);

SELECT changeHour(toDate32('2000-01-01'), 24);

SELECT changeHour(toDateTime('2000-01-01 11:22:33'), 0);

SELECT changeHour(toDateTime('2000-01-01 11:22:33'), 2);

SELECT changeHour(toDateTime('2000-01-01 11:22:33'), 23);

SELECT changeHour(toDateTime('2000-01-01 11:22:33'), -1);

SELECT changeHour(toDateTime('2000-01-01 11:22:33'), 24);

SELECT changeHour(toDateTime64('2000-01-01 11:22:33.4444', 4), 0);

SELECT changeHour(toDateTime64('2000-01-01 11:22:33.4444', 4), 2);

SELECT changeHour(toDateTime64('2000-01-01 11:22:33.4444', 4), 23);

SELECT changeHour(toDateTime64('2000-01-01 11:22:33.4444', 4), -1);

SELECT changeHour(toDateTime64('2000-01-01 11:22:33.4444', 4), 24);

SELECT changeHour(toDate('2000-01-01'), -1)
SETTINGS session_timezone = 'Asia/Novosibirsk';

SELECT changeHour(toDate('2000-01-01'), 24)
SETTINGS session_timezone = 'Asia/Novosibirsk';

SELECT changeMinute(toDate('2000-01-01'), 0);

SELECT changeMinute(toDate('2000-01-01'), 2);

SELECT changeMinute(toDate('2000-01-01'), 59);

SELECT changeMinute(toDate('2000-01-01'), -1);

SELECT changeMinute(toDate('2000-01-01'), 60);

SELECT changeMinute(toDate32('2000-01-01'), 0);

SELECT changeMinute(toDate32('2000-01-01'), 2);

SELECT changeMinute(toDate32('2000-01-01'), 59);

SELECT changeMinute(toDate32('2000-01-01'), -1);

SELECT changeMinute(toDate32('2000-01-01'), 60);

SELECT changeMinute(toDateTime('2000-01-01 11:22:33'), 0);

SELECT changeMinute(toDateTime('2000-01-01 11:22:33'), 2);

SELECT changeMinute(toDateTime('2000-01-01 11:22:33'), 59);

SELECT changeMinute(toDateTime('2000-01-01 11:22:33'), -1);

SELECT changeMinute(toDateTime('2000-01-01 11:22:33'), 60);

SELECT changeMinute(toDateTime64('2000-01-01 11:22:33.4444', 4), 0);

SELECT changeMinute(toDateTime64('2000-01-01 11:22:33.4444', 4), 2);

SELECT changeMinute(toDateTime64('2000-01-01 11:22:33.4444', 4), 59);

SELECT changeMinute(toDateTime64('2000-01-01 11:22:33.4444', 4), -1);

SELECT changeMinute(toDateTime64('2000-01-01 11:22:33.4444', 4), 60);

SELECT changeMinute(toDate('2000-01-01'), -1)
SETTINGS session_timezone = 'Asia/Novosibirsk';

SELECT changeMinute(toDate('2000-01-01'), 60)
SETTINGS session_timezone = 'Asia/Novosibirsk';

SELECT changeSecond(toDate('2000-01-01'), 0);

SELECT changeSecond(toDate('2000-01-01'), 2);

SELECT changeSecond(toDate('2000-01-01'), 59);

SELECT changeSecond(toDate('2000-01-01'), -1);

SELECT changeSecond(toDate('2000-01-01'), 60);

SELECT changeSecond(toDate32('2000-01-01'), 0);

SELECT changeSecond(toDate32('2000-01-01'), 2);

SELECT changeSecond(toDate32('2000-01-01'), 59);

SELECT changeSecond(toDate32('2000-01-01'), -1);

SELECT changeSecond(toDate32('2000-01-01'), 60);

SELECT changeSecond(toDateTime('2000-01-01 11:22:33'), 0);

SELECT changeSecond(toDateTime('2000-01-01 11:22:33'), 2);

SELECT changeSecond(toDateTime('2000-01-01 11:22:33'), 59);

SELECT changeSecond(toDateTime('2000-01-01 11:22:33'), -1);

SELECT changeSecond(toDateTime('2000-01-01 11:22:33'), 60);

SELECT changeSecond(toDateTime64('2000-01-01 11:22:33.4444', 4), 0);

SELECT changeSecond(toDateTime64('2000-01-01 11:22:33.4444', 4), 2);

SELECT changeSecond(toDateTime64('2000-01-01 11:22:33.4444', 4), 59);

SELECT changeSecond(toDateTime64('2000-01-01 11:22:33.4444', 4), -1);

SELECT changeSecond(toDateTime64('2000-01-01 11:22:33.4444', 4), 60);

SELECT changeSecond(toDate('2000-01-01'), -1)
SETTINGS session_timezone = 'Asia/Novosibirsk';

SELECT changeSecond(toDate('2000-01-01'), 60)
SETTINGS session_timezone = 'Asia/Novosibirsk';