SET allow_deprecated_error_prone_window_functions = 1;

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([0, 1, 5, 10]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([2, Null, 3, Null, 10]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([Null, 1]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([Null, Null, 1, 3, Null, Null, 5]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([0, 1, 5, 10, 170141183460469231731687303715884105727]::Array(UInt128)) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([0, 1, 5, 10, 170141183460469231731687303715884105728]::Array(UInt256)) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([0, 1, 5, 10, 170141183460469231731687303715884105727]::Array(Int128)) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([0, 1, 5, 10, 170141183460469231731687303715884105728]::Array(Int256)) AS x
    );

SELECT '--Date Difference--';

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([Null, Null, toDate('1970-1-1'), toDate('1970-12-31'), Null, Null,  toDate('2010-8-9')]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([Null, Null, toDate32('1900-1-1'), toDate32('1930-5-25'), toDate('1990-9-4'), Null,  toDate32('2279-5-4')]) AS x
    );

SELECT runningDifference(x)
FROM (
        SELECT arrayJoin([Null, Null, toDateTime('1970-06-28 23:48:12', 'Asia/Istanbul'), toDateTime('2070-04-12 21:16:41', 'Asia/Istanbul'), Null, Null, toDateTime('2106-02-03 06:38:52', 'Asia/Istanbul')]) AS x
    );