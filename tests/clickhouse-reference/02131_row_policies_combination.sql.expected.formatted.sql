SELECT *
FROM `02131_rptable`;

SELECT *
FROM `02131_rptable`
PREWHERE x >= 2
SETTINGS additional_table_filters = map('02131_rptable', 'x > 1');

SELECT *
FROM `02131_rptable`
PREWHERE x >= 2
SETTINGS additional_result_filter = 'x > 1';

SELECT *
FROM `02131_rptable`
WHERE x >= 2
SETTINGS additional_table_filters = map('02131_rptable', 'x > 1');