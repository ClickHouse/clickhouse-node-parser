SELECT timestamp('2013-12-31');

SELECT timestamp('2013-12-31 12:00:00');

SELECT timestamp('2013-12-31 12:00:00.111111');

SELECT timestamp('2013-12-31 12:00:00.1111111');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.1');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.11');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.111');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.1111');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.11111');

SELECT timestamp('2013-12-31 12:00:00', '12:01:02.111111');

SELECT timestamp('2013-12-31 12:00:00', '-12:01:02.111111');

SELECT timestamp('2013-12-31 12:00:00', '-1:01:02.111111');

SELECT timestamp('2013-12-31 12:00:00', '-100:01:02.111111');

SELECT timestamp('2013-12-31 12:00:00', '32767:01:02.111111');

SELECT timestamp('2013-12-31 12:00:00', '32768:01:02.111111');

SELECT timestamp(materialize('2013-12-31'));

SELECT timestamp(materialize('2013-12-31 12:00:00'), materialize('12:00:00'));

SELECT timestamp();

SELECT timestamp('2013-12-31 12:00:00', '12:00:00', '');

SELECT timestamp(1);

SELECT timestamp(1, 2);