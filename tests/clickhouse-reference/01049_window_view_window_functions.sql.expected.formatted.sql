SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalSecond(1), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalMinute(1), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalHour('1'), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek(1), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalMonth('1'), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalQuarter('1'), 'US/Samoa');

SELECT tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalYear('1'), 'US/Samoa');

SELECT tumbleStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa');

SELECT toDateTime(tumbleStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa'), 'US/Samoa');

SELECT tumbleStart(tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa'));

SELECT tumbleEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa');

SELECT toDateTime(tumbleEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa'), 'US/Samoa');

SELECT tumbleEnd(tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), 'US/Samoa'));

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalSecond(1), toIntervalSecond(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalMinute(1), toIntervalMinute(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalHour(1), toIntervalHour(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay(1), toIntervalDay(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek(1), toIntervalWeek(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalMonth(1), toIntervalMonth(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalQuarter(1), toIntervalQuarter(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalYear(1), toIntervalYear(3), 'US/Samoa');

SELECT hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa');

SELECT hopStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa');

SELECT toDateTime(hopStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa'), 'US/Samoa');

SELECT hopStart(hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa'));

SELECT hopEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa');

SELECT toDateTime(hopEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa'), 'US/Samoa');

SELECT hopEnd(hop(toDateTime('2019-01-09 12:00:01', 'US/Samoa'), toIntervalDay('1'), toIntervalDay('3'), 'US/Samoa'));

SELECT hopStart(tuple());

SELECT hopEnd(tuple());

SELECT tumbleStart(tuple());

SELECT tumbleEnd(tuple());

SELECT tumbleStart(toUInt32(42))
SETTINGS session_timezone = 'UTC';

SELECT tumbleStart((now(), now(), 'meow'));

SELECT tumbleStart(now());

SELECT hopEnd((makeDateTime(null), toDateTime('2025-02-07 17:23:42')))
SETTINGS session_timezone = 'UTC';

SELECT hopStart((toDateTime('2025-02-07 17:23:42'), makeDateTime(null)))
SETTINGS session_timezone = 'UTC';

SELECT hopEnd((toDateTime('2025-02-07 17:23:42'), makeDateTime(null)));