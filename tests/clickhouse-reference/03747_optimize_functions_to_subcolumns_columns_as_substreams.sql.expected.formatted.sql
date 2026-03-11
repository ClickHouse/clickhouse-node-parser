SELECT id
FROM test_empty_array
WHERE empty(a)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_array
WHERE empty(a)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_notempty_array
WHERE notEmpty(a)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_array
WHERE notEmpty(a)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT
    id,
    length(a)
FROM test_length_array
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(a)
FROM test_length_array
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_empty_string
WHERE empty(s)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_string
WHERE empty(s)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_notempty_string
WHERE notEmpty(s)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_string
WHERE notEmpty(s)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT
    id,
    length(s)
FROM test_length_string
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(s)
FROM test_length_string
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_empty_map
WHERE empty(m)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_map
WHERE empty(m)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_notempty_map
WHERE notEmpty(m)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_map
WHERE notEmpty(m)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT
    id,
    length(m)
FROM test_length_map
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(m)
FROM test_length_map
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_isnull
WHERE isNull(n)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_isnull
WHERE isNull(n)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT id
FROM test_isnotnull
WHERE isNotNull(n)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_isnotnull
WHERE isNotNull(n)
SETTINGS optimize_functions_to_subcolumns = 0;

SELECT count(n)
FROM test_count_nullable
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT count(n)
FROM test_count_nullable
SETTINGS optimize_functions_to_subcolumns = 0;