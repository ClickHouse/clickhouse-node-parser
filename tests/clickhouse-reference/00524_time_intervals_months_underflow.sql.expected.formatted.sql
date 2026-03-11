SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(0) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(11) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(12) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(13) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(-1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(-11) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(-12) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalMonth(-13) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(0) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(11) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(12) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(13) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(-1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(-11) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(-12) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalMonth(-13) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(0) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(1) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(11) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(12) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(13) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(-1) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(-11) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(-12) AS x;

SELECT toDate('2017-01-01') + toIntervalMonth(-13) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(0) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(1) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(11) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(12) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(13) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(-1) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(-11) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(-12) AS x;

SELECT toDate('2017-01-01') - toIntervalMonth(-13) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalYear(0) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalYear(1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') + toIntervalYear(-1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalYear(0) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalYear(1) AS x;

SELECT toDateTime('2017-01-01 00:00:00') - toIntervalYear(-1) AS x;

SELECT toDate('2017-01-01') + toIntervalYear(0) AS x;

SELECT toDate('2017-01-01') + toIntervalYear(1) AS x;

SELECT toDate('2017-01-01') + toIntervalYear(-1) AS x;

SELECT toDate('2017-01-01') - toIntervalYear(0) AS x;

SELECT toDate('2017-01-01') - toIntervalYear(1) AS x;

SELECT toDate('2017-01-01') - toIntervalYear(-1) AS x;

SELECT toIntervalMonth(number - 15) + toDate('2017-01-01') AS x
FROM `system`.numbers
LIMIT 30;

SELECT toDate('2017-01-01') - toIntervalMonth(number - 15) AS x
FROM `system`.numbers
LIMIT 30;

SELECT toIntervalYear(number - 15) + toDate('2017-01-01') AS x
FROM `system`.numbers
LIMIT 30;

SELECT toDate('2017-01-01') - toIntervalYear(number - 15) AS x
FROM `system`.numbers
LIMIT 30;

SELECT toDate32('2217-01-01') + toIntervalDay(number * 20 - 100) AS x
FROM `system`.numbers
LIMIT 10;

SELECT toIntervalDay(100 - number * 20) + toDate32('2217-01-01') AS x
FROM `system`.numbers
LIMIT 10;

SELECT toIntervalMonth(number * 4 - 20) + toDate32('2217-01-01') AS x
FROM `system`.numbers
LIMIT 10;

SELECT toDate32('2217-01-01') - toIntervalMonth(number * 4 - 20) AS x
FROM `system`.numbers
LIMIT 10;

SELECT toIntervalYear(number * 4 - 20) + toDate32('2217-01-01') AS x
FROM `system`.numbers
LIMIT 10;

SELECT toDate32('2217-01-01') - toIntervalYear(number * 4 - 20) AS x
FROM `system`.numbers
LIMIT 10;