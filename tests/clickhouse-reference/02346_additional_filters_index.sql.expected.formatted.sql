SELECT *
FROM table_1
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x > 3');

SELECT *
FROM table_1
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'x < 3');

SELECT *
FROM table_1
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'length(y) >= 3');

SELECT *
FROM table_1
ORDER BY x ASC
SETTINGS additional_table_filters = map('table_1', 'length(y) < 3');

SELECT *
FROM distr_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('distr_table', 'x > 3');

SELECT *
FROM distr_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('distr_table', 'x < 3');

SELECT *
FROM distr_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('distr_table', 'length(y) > 3');

SELECT *
FROM distr_table
ORDER BY x ASC
SETTINGS additional_table_filters = map('distr_table', 'length(y) < 3');