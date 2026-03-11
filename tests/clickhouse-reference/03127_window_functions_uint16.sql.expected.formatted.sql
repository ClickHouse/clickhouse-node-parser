SELECT tumbleStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa');

SELECT toDateTime(tumbleStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa'), 'US/Samoa');

SELECT tumbleStart(tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa'));

SELECT tumbleEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa');

SELECT toDateTime(tumbleEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa'), 'US/Samoa');

SELECT tumbleEnd(tumble(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), 'US/Samoa'));

SELECT hopStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa');

SELECT toDateTime(hopStart(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa'), 'US/Samoa');

SELECT hopStart(hop(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa'));

SELECT hopEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa');

SELECT toDateTime(hopEnd(toDateTime('2020-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa'), 'US/Samoa');

SELECT hopEnd(hop(toDateTime('2019-01-09 12:00:01', 'US/Samoa'), toIntervalWeek('1'), toIntervalWeek('3'), 'US/Samoa'));