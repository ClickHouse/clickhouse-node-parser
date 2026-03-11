SELECT toModifiedJulianDay('1858-11-16');

SELECT toModifiedJulianDay('1858-11-17');

SELECT toModifiedJulianDay('2020-11-01');

SELECT toModifiedJulianDay(NULL);

SELECT toModifiedJulianDay('unparsable');

SELECT toModifiedJulianDay('1999-02-29');

SELECT toModifiedJulianDay('1999-13-32');

SELECT toModifiedJulianDayOrNull('2020-11-01');

SELECT toModifiedJulianDayOrNull('unparsable');

SELECT toModifiedJulianDayOrNull('1999-02-29');

SELECT toModifiedJulianDayOrNull('1999-13-32');

SELECT toModifiedJulianDay(d)
FROM toModifiedJulianDay_test;