SELECT formatDateTime(toDateTime64('2024-12-11 12:34:56.000', 3, 'US/Pacific'), '%W%z');

SELECT formatDateTime(toDateTime64('2024-12-11 12:34:56.000', 3, 'US/Eastern'), '%W%z');

SELECT formatDateTime(toDateTime64('2024-12-11 12:34:56.000', 3, 'UTC'), '%W%z');

SELECT formatDateTime(toDateTime64('2024-12-11 12:34:56.000', 3, 'Europe/Berlin'), '%W%z');

SELECT formatDateTime(toDateTime64('2024-12-11 12:34:56.000', 3, 'Europe/Athens'), '%W%z');