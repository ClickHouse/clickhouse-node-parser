WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon),
    toDayOfWeek(date_sun);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 0),
    toDayOfWeek(date_sun, 0);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 1),
    toDayOfWeek(date_sun, 1);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 2),
    toDayOfWeek(date_sun, 2);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 3),
    toDayOfWeek(date_sun, 3);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 4),
    toDayOfWeek(date_sun, 4);

WITH toDate('2023-01-09') AS date_mon,

date_mon - 1 AS date_sun

SELECT
    toDayOfWeek(date_mon, 5),
    toDayOfWeek(date_sun, 5);

SELECT toDayOfWeek(today(), -1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }