SELECT toDate32('1990-02-01') = toDate('1990-02-01');

SELECT toDate('1991-01-02') > toDate32('1990-02-01');

SELECT toDate32('1925-02-01') <= toDate('1990-02-01');

SELECT toDate('1991-02-01') < toDate32('2283-11-11');

SELECT toDate32('1990-02-01') = toDateTime('1990-02-01');

SELECT toDateTime('1991-01-02') > toDate32('1990-02-01');

SELECT toDate32('1925-02-01') <= toDateTime('1990-02-01');

SELECT toDateTime('1991-02-01') < toDate32('2283-11-11');

SELECT toDate32('1990-02-01') = toDateTime64('1990-02-01', 2);

SELECT toDateTime64('1991-01-02', 2) > toDate32('1990-02-01');

SELECT toDate32('1925-02-01') = toDateTime64('1925-02-01', 2);

SELECT toDateTime64('1925-02-02', 2) > toDate32('1925-02-01');

SELECT toDate32('2283-11-11') = toDateTime64('2283-11-11', 2);

SELECT toDateTime64('2283-11-11', 2) > toDate32('1925-02-01');

SELECT toDate32('1990-02-01') = '1990-02-01';

SELECT '1991-01-02' > toDate32('1990-02-01');

SELECT toDate32('1925-02-01') = '1925-02-01';

SELECT '2283-11-11' >= toDate32('2283-11-10');

SELECT '2283-11-11' > toDate32('1925-02-01');