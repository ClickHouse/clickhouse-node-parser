SELECT parseDateTime('2020', '%Y', 'UTC') = toDateTime('2020-01-01', 'UTC');

SELECT parseDateTime('02', '%m', 'UTC') = toDateTime('2000-02-01', 'UTC');

SELECT parseDateTime('07', '%m', 'UTC') = toDateTime('2000-07-01', 'UTC');

SELECT parseDateTime('11-', '%m-', 'UTC') = toDateTime('2000-11-01', 'UTC');

SELECT parseDateTime('00', '%m');

SELECT parseDateTime('13', '%m');

SELECT parseDateTime('12345', '%m');

SELECT parseDateTime('02', '%c', 'UTC') = toDateTime('2000-02-01', 'UTC');

SELECT parseDateTime('07', '%c', 'UTC') = toDateTime('2000-07-01', 'UTC');

SELECT parseDateTime('11-', '%c-', 'UTC') = toDateTime('2000-11-01', 'UTC');

SELECT parseDateTime('00', '%c');

SELECT parseDateTime('13', '%c');

SELECT parseDateTime('12345', '%c');

SELECT parseDateTime('jun', '%b', 'UTC') = toDateTime('2000-06-01', 'UTC');

SELECT parseDateTime('abc', '%b');

SELECT parseDateTime('may', '%M', 'UTC') = toDateTime('2000-05-01', 'UTC');

SELECT parseDateTime('september', '%M', 'UTC') = toDateTime('2000-09-01', 'UTC');

SELECT parseDateTime('summer', '%M');

SELECT parseDateTime('08', '%M', 'UTC') = toDateTime('1970-01-01 00:08:00', 'UTC');

SELECT parseDateTime('59', '%M', 'UTC') = toDateTime('1970-01-01 00:59:00', 'UTC');

SELECT parseDateTime('00/', '%M/', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('60', '%M', 'UTC');

SELECT parseDateTime('-1', '%M', 'UTC');

SELECT parseDateTime('123456789', '%M', 'UTC');

SELECT parseDateTime('07', '%d', 'UTC') = toDateTime('2000-01-07', 'UTC');

SELECT parseDateTime('01', '%d', 'UTC') = toDateTime('2000-01-01', 'UTC');

SELECT parseDateTime('/11', '/%d', 'UTC') = toDateTime('2000-01-11', 'UTC');

SELECT parseDateTime('00', '%d');

SELECT parseDateTime('32', '%d');

SELECT parseDateTime('12345', '%d');

SELECT parseDateTime('02-31', '%m-%d');

SELECT parseDateTime('04-31', '%m-%d');

SELECT parseDateTime('01 31 20 02', '%m %d %d %m', 'UTC') = toDateTime('2000-02-20', 'UTC');

SELECT parseDateTime('02 31 20 04', '%m %d %d %m', 'UTC') = toDateTime('2000-04-20', 'UTC');

SELECT parseDateTime('02 31 01', '%m %d %m', 'UTC') = toDateTime('2000-01-31', 'UTC');

SELECT parseDateTime('2000-02-29', '%Y-%m-%d', 'UTC') = toDateTime('2000-02-29', 'UTC');

SELECT parseDateTime('2001-02-29', '%Y-%m-%d');

SELECT parseDateTime('001', '%j', 'UTC') = toDateTime('2000-01-01', 'UTC');

SELECT parseDateTime('007', '%j', 'UTC') = toDateTime('2000-01-07', 'UTC');

SELECT parseDateTime('/031/', '/%j/', 'UTC') = toDateTime('2000-01-31', 'UTC');

SELECT parseDateTime('032', '%j', 'UTC') = toDateTime('2000-02-01', 'UTC');

SELECT parseDateTime('060', '%j', 'UTC') = toDateTime('2000-02-29', 'UTC');

SELECT parseDateTime('365', '%j', 'UTC') = toDateTime('2000-12-30', 'UTC');

SELECT parseDateTime('366', '%j', 'UTC') = toDateTime('2000-12-31', 'UTC');

SELECT parseDateTime('1980 001', '%Y %j', 'UTC') = toDateTime('1980-01-01', 'UTC');

SELECT parseDateTime('1980 007', '%Y %j', 'UTC') = toDateTime('1980-01-07', 'UTC');

SELECT parseDateTime('1980 /007', '%Y /%j', 'UTC') = toDateTime('1980-01-07', 'UTC');

SELECT parseDateTime('1980 /031/', '%Y /%j/', 'UTC') = toDateTime('1980-01-31', 'UTC');

SELECT parseDateTime('1980 032', '%Y %j', 'UTC') = toDateTime('1980-02-01', 'UTC');

SELECT parseDateTime('1980 060', '%Y %j', 'UTC') = toDateTime('1980-02-29', 'UTC');

SELECT parseDateTime('1980 366', '%Y %j', 'UTC') = toDateTime('1980-12-31', 'UTC');

SELECT parseDateTime('1981 366', '%Y %j');

SELECT parseDateTime('367', '%j');

SELECT parseDateTime('000', '%j');

SELECT parseDateTime('2000 366 2001', '%Y %j %Y');

SELECT parseDateTime('2001 366 2000', '%Y %j %Y', 'UTC') = toDateTime('2000-12-31', 'UTC');

SELECT parseDateTime('07', '%H', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('23', '%H', 'UTC') = toDateTime('1970-01-01 23:00:00', 'UTC');

SELECT parseDateTime('00', '%H', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('10', '%H', 'UTC') = toDateTime('1970-01-01 10:00:00', 'UTC');

SELECT parseDateTime('24', '%H', 'UTC');

SELECT parseDateTime('-1', '%H', 'UTC');

SELECT parseDateTime('1234567', '%H', 'UTC');

SELECT parseDateTime('07', '%k', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('23', '%k', 'UTC') = toDateTime('1970-01-01 23:00:00', 'UTC');

SELECT parseDateTime('00', '%k', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('10', '%k', 'UTC') = toDateTime('1970-01-01 10:00:00', 'UTC');

SELECT parseDateTime('24', '%k', 'UTC');

SELECT parseDateTime('-1', '%k', 'UTC');

SELECT parseDateTime('1234567', '%k', 'UTC');

SELECT parseDateTime('12', '%h', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('01', '%h', 'UTC') = toDateTime('1970-01-01 01:00:00', 'UTC');

SELECT parseDateTime('00', '%h', 'UTC');

SELECT parseDateTime('13', '%h', 'UTC');

SELECT parseDateTime('123456789', '%h', 'UTC');

SELECT parseDateTime('07', '%I', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('12', '%I', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('01', '%I', 'UTC') = toDateTime('1970-01-01 01:00:00', 'UTC');

SELECT parseDateTime('10', '%I', 'UTC') = toDateTime('1970-01-01 10:00:00', 'UTC');

SELECT parseDateTime('00', '%I', 'UTC');

SELECT parseDateTime('13', '%I', 'UTC');

SELECT parseDateTime('123456789', '%I', 'UTC');

SELECT parseDateTime('07', '%l', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('12', '%l', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('01', '%l', 'UTC') = toDateTime('1970-01-01 01:00:00', 'UTC');

SELECT parseDateTime('10', '%l', 'UTC') = toDateTime('1970-01-01 10:00:00', 'UTC');

SELECT parseDateTime('00', '%l', 'UTC');

SELECT parseDateTime('13', '%l', 'UTC');

SELECT parseDateTime('123456789', '%l', 'UTC');

SELECT parseDateTime('07 PM', '%H %p', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('07 AM', '%H %p', 'UTC') = toDateTime('1970-01-01 07:00:00', 'UTC');

SELECT parseDateTime('00 AM', '%H %p', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('00 PM', '%H %p', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('01 PM', '%h %p', 'UTC') = toDateTime('1970-01-01 13:00:00', 'UTC');

SELECT parseDateTime('01 AM', '%h %p', 'UTC') = toDateTime('1970-01-01 01:00:00', 'UTC');

SELECT parseDateTime('06 PM', '%h %p', 'UTC') = toDateTime('1970-01-01 18:00:00', 'UTC');

SELECT parseDateTime('06 AM', '%h %p', 'UTC') = toDateTime('1970-01-01 06:00:00', 'UTC');

SELECT parseDateTime('12 PM', '%h %p', 'UTC') = toDateTime('1970-01-01 12:00:00', 'UTC');

SELECT parseDateTime('12 AM', '%h %p', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('08', '%i', 'UTC') = toDateTime('1970-01-01 00:08:00', 'UTC');

SELECT parseDateTime('59', '%i', 'UTC') = toDateTime('1970-01-01 00:59:00', 'UTC');

SELECT parseDateTime('00/', '%i/', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('60', '%i', 'UTC');

SELECT parseDateTime('-1', '%i', 'UTC');

SELECT parseDateTime('09', '%s', 'UTC') = toDateTime('1970-01-01 00:00:09', 'UTC');

SELECT parseDateTime('58', '%s', 'UTC') = toDateTime('1970-01-01 00:00:58', 'UTC');

SELECT parseDateTime('00/', '%s/', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('60', '%s', 'UTC');

SELECT parseDateTime('-1', '%s', 'UTC');

SELECT parseDateTime('123456789', '%s', 'UTC');

SELECT parseDateTime('000000', '%f', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('456789', '%f', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('42', '%f', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('12ABCD', '%f', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTime('2021-01-04+23:00:00.654321', '%Y-%m-%d+%H:%i:%s.%f', 'UTC') = toDateTime('2021-01-04 23:00:00', 'UTC');

SELECT parseDateTime('2019-07-03 11:04:10.975319', '%Y-%m-%d %H:%i:%s.%f', 'UTC') = toDateTime('2019-07-03 11:04:10', 'UTC');

SELECT parseDateTime('10:04:11 03-07-2019.242424', '%s:%i:%H %d-%m-%Y.%f', 'UTC') = toDateTime('2019-07-03 11:04:10', 'UTC');

SELECT parseDateTimeOrZero('10:04:11 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC') = toDateTime('2019-07-03 11:04:10', 'UTC');

SELECT parseDateTimeOrZero('10:04:11 invalid 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC') = toDateTime('1970-01-01 00:00:00', 'UTC');

SELECT parseDateTimeOrNull('10:04:11 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC') = toDateTime('2019-07-03 11:04:10', 'UTC');

SELECT isNull(parseDateTimeOrNull('10:04:11 invalid 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC'));

SELECT str_to_date('10:04:11 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC') = toDateTime('2019-07-03 11:04:10', 'UTC');

SELECT isNull(str_to_date('10:04:11 invalid 03-07-2019', '%s:%i:%H %d-%m-%Y', 'UTC'));

SELECT parseDateTime();

SELECT parseDateTime('12 AM', '%h %p', 'UTC', 'a fourth argument');

SELECT parseDateTime('', '', toString(number))
FROM numbers(13);

SELECT parseDateTime('Aug 13, 2022, 7:58:32 PM', '%b %e, %G, %h:%i:%s %p', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 07:58:32 PM', '%b %e, %G, %h:%i:%s %p', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 7:58:32 PM', '%b %e, %G, %l:%i:%s %p', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 07:58:32 PM', '%b %e, %G, %l:%i:%s %p', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 7:58:32', '%b %e, %G, %H:%i:%s', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 07:58:32', '%b %e, %G, %H:%i:%s', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 7:58:32', '%b %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('Aug 13, 2022, 07:58:32', '%b %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('8 13, 2022, 7:58:32', '%m %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('08 13, 2022, 07:58:32', '%m %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('8 13, 2022, 7:58:32', '%c %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('08 13, 2022, 07:58:32', '%c %e, %G, %k:%i:%s', 'UTC');

SELECT parseDateTime('2021-01-04 23:12:34') = toDateTime('2021-01-04 23:12:34');

SELECT parseDateTime('');

SELECT parseDateTime('  1/12/2024', '%e/%m/%Y')
SETTINGS parsedatetime_e_requires_space_padding = 0;

SELECT parseDateTime('1/12/2024', '%e/%m/%Y')
SETTINGS parsedatetime_e_requires_space_padding = 0;

SELECT parseDateTime('  1/12/2024', '%e/%m/%Y')
SETTINGS parsedatetime_e_requires_space_padding = 1;

SELECT parseDateTime('1/12/2024', '%e/%m/%Y')
SETTINGS parsedatetime_e_requires_space_padding = 1;

SELECT parseDateTime64('');

SELECT parseDateTime64('2021-01-04 23:12:34.118');

SELECT parseDateTime64('2177-10-09 10:30:10.123');

SELECT parseDateTime64('2021-01-04 23:12:34.118112') = toDateTime64('2021-01-04 23:12:34.118112', 6);

SELECT parseDateTime64('2021-01-04 23:12:34.118112', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('2021-01-04 23:12:34.118112', 6);

SELECT parseDateTime64('2021-01-04 23:12:34.118', '%Y-%m-%d %H:%i:%s.%f');

SELECT parseDateTime64('2021-01-04 23:12:34.11811235', '%Y-%m-%d %H:%i:%s.%f');

SELECT parseDateTime64('2021-01-04 23:12:34.118112', '%Y-%m-%d %H:%i:%s');

SELECT parseDateTime64('2024-02-29 11:23:34.123433', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('2024-02-29 11:23:34.123433', 6);

SELECT parseDateTime64('2023-02-29 11:22:33.123433', '%Y-%m-%d %H:%i:%s.%f');

SELECT parseDateTime64('2024-02-28 23:22:33.123433', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('2024-02-28 23:22:33.123433', 6);

SELECT parseDateTime64('2023-02-28 23:22:33.123433', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('2023-02-28 23:22:33.123433', 6);

SELECT isNull(parseDateTime64OrNull('2021-01-04 23:12:34.118'));

SELECT isNull(parseDateTime64OrNull('2021-01-04 23:12:34.118', '%Y-%m-%d %H:%i:%s.%f'));

SELECT isNull(parseDateTime64OrNull('2021-01-04 23:12:34.118112', '%Y-%m-%d %H:%i:%s'));

SELECT isNull(parseDateTime64OrNull('2021-01-04 23:12:34.11811235', '%Y-%m-%d %H:%i:%s.%f'));

SELECT parseDateTime64OrZero('2021-01-04 23:12:34.118') = toDateTime64('1970-01-01 00:00:00', 6);

SELECT parseDateTime64OrZero('2021-01-04 23:12:34.118', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('1970-01-01 00:00:00', 6);

SELECT parseDateTime64OrZero('2021-01-04 23:12:34.118112', '%Y-%m-%d %H:%i:%s') = toDateTime64('1970-01-01 00:00:00', 6);

SELECT parseDateTime64OrZero('2021-01-04 23:12:34.11811235', '%Y-%m-%d %H:%i:%s.%f') = toDateTime64('1970-01-01 00:00:00', 6);

SELECT parseDateTime64('1899-12-31 23:59:59', '%Y-%m-%d %H:%i:%s');

SELECT parseDateTime64('1900-01-01 00:00:00', '%Y-%m-%d %H:%i:%s') = toDateTime64('1900-01-01 00:00:00', 0);

SELECT parseDateTime64('1920-06-06 00:00:01', '%Y-%m-%d %H:%i:%s') = toDateTime64('1920-06-06 00:00:01', 0);

SELECT parseDateTime64('1970-01-01 00:00:00', '%Y-%m-%d %H:%i:%s') = toDateTime64('1970-01-01 00:00:00', 0);

SELECT parseDateTime64('1971-02-03 04:05:06', '%Y-%m-%d %H:%i:%s') = toDateTime64('1971-02-03 04:05:06', 0);

SELECT parseDateTime64('2105-02-03 04:05:06', '%Y-%m-%d %H:%i:%s') = toDateTime64('2105-02-03 04:05:06', 0);

SELECT parseDateTime64('2106-02-07 06:28:15', '%Y-%m-%d %H:%i:%s') = toDateTime64('2106-02-07 06:28:15', 0);

SELECT parseDateTime64('2106-02-08 06:28:15', '%Y-%m-%d %H:%i:%s') = toDateTime64('2106-02-08 06:28:15', 0);

SELECT parseDateTime64('2299-12-31 23:59:59', '%Y-%m-%d %H:%i:%s') = toDateTime64('2299-12-31 23:59:59', 0);

SELECT parseDateTime64('2300-01-01 00:00:00', '%Y-%m-%d %H:%i:%s');