SELECT
    '03717_table',
    *
FROM `03717_table`
ORDER BY `all` ASC;

SELECT
    '03717_mv_table_odd',
    sum(value)
FROM `03717_mv_table_odd`
ORDER BY `all` ASC;

SELECT
    '03717_mv_table_even',
    sum(value)
FROM `03717_mv_table_even`
ORDER BY `all` ASC;

SELECT
    '03717_mv_table_all',
    sum(value)
FROM `03717_mv_table_all`
ORDER BY `all` ASC;