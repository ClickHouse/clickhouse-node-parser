SELECT
    formatDateTime(toDate('2024-05-07'), '%e/%m/%Y') AS _date,
    length(_date);

SELECT
    formatDateTime(toDate('2024-05-07'), '%e/%m/%Y') AS _date,
    length(_date)
SETTINGS formatdatetime_e_with_space_padding = 1;

SELECT
    formatDateTime(toDate('2024-05-07'), '%e/%m/%Y') AS _date,
    length(_date)
SETTINGS formatdatetime_e_with_space_padding = 0;