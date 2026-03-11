SELECT fromModifiedJulianDay(-1);

SELECT fromModifiedJulianDay(0);

SELECT fromModifiedJulianDay(59154);

SELECT fromModifiedJulianDay(NULL);

SELECT fromModifiedJulianDay(CAST(NULL, 'Nullable(Int64)'));

SELECT fromModifiedJulianDay(-678942);

SELECT fromModifiedJulianDay(-678941);

SELECT fromModifiedJulianDay(2973483);

SELECT fromModifiedJulianDay(2973484);

SELECT fromModifiedJulianDayOrNull(59154);

SELECT fromModifiedJulianDayOrNull(NULL);

SELECT fromModifiedJulianDayOrNull(-678942);

SELECT fromModifiedJulianDayOrNull(2973484);

SELECT fromModifiedJulianDay(d)
FROM fromModifiedJulianDay_test;