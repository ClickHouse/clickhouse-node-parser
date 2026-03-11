SELECT formatDateTime(toDateTime64('2024-01-01 12:00:00.12345678', 8, 'UTC'), '%M %f')
SETTINGS formatdatetime_f_prints_scale_number_of_digits = 1;

SELECT formatDateTime(toDateTime64('2024-01-01 12:00:00.1234', 4, 'UTC'), '%M %f')
SETTINGS formatdatetime_f_prints_scale_number_of_digits = 1;

SELECT formatDateTime(toDateTime64('2024-01-01 12:00:00', 0, 'UTC'), '%M %f')
SETTINGS formatdatetime_f_prints_scale_number_of_digits = 1;

SELECT formatDateTime(toDateTime64('2024-01-01 12:00:00.1234', 4, 'UTC'), '%M %f')
SETTINGS formatdatetime_f_prints_single_zero = 1;

SELECT formatDateTime(toDateTime64('2024-01-01 12:00:00', 0, 'UTC'), '%M %f')
SETTINGS formatdatetime_f_prints_single_zero = 1;

SELECT formatDateTimeInJodaSyntax(toDateTime64('2024-01-01 12:00:00.005', 3, 'UTC'), 'SSS');

SELECT formatDateTimeInJodaSyntax(toDateTime64('2024-01-01 12:00:00.050', 3, 'UTC'), 'SSS');

SELECT formatDateTimeInJodaSyntax(toDateTime64('2024-01-01 12:00:00.005', 3, 'UTC'), 'SSSSSS');

SELECT formatDateTimeInJodaSyntax(toDateTime64('2024-01-01 12:00:00.005', 3, 'UTC'), 'SS');