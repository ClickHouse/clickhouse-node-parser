-- check text index was created
SELECT
    name,
    type
FROM `system`.data_skipping_indices
WHERE table == 'tab'
    AND database = currentDatabase()
LIMIT 1;

-- search text index with ==
SELECT *
FROM tab
WHERE s == 'Alick a01';

SELECT read_rows == 2
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab WHERE s == ''Alick a01'';')
    AND type = 'QueryFinish'
    AND result_rows == 1
LIMIT 1;

-- search text index with LIKE
SELECT *
FROM tab
WHERE like(s, '%01%')
ORDER BY k ASC;

SELECT read_rows == 4
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab WHERE s LIKE ''%01%'' ORDER BY k;')
    AND type = 'QueryFinish'
    AND result_rows == 2
LIMIT 1;

-- search text index with hasToken
SELECT *
FROM tab
WHERE hasToken(s, 'Click')
ORDER BY k ASC;

SELECT read_rows == 8
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab WHERE hasToken(s, ''Click'') ORDER BY k;')
    AND type = 'QueryFinish'
    AND result_rows == 4
LIMIT 1;

-- check text index was created
SELECT
    name,
    type
FROM `system`.data_skipping_indices
WHERE table == 'tab_x'
    AND database = currentDatabase()
LIMIT 1;

-- search text index with hasToken
SELECT *
FROM tab_x
WHERE hasToken(s, 'Alick')
ORDER BY k ASC;

SELECT read_rows == 8
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab_x WHERE hasToken(s, ''Alick'');')
    AND type = 'QueryFinish'
    AND result_rows == 4
LIMIT 1;

-- search text index with IN operator
SELECT *
FROM tab_x
WHERE s IN ('x Alick a01 y', 'x Alick a06 y')
ORDER BY k ASC;

SELECT read_rows == 4
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab_x WHERE s IN (''x Alick a01 y'', ''x Alick a06 y'') ORDER BY k;')
    AND type = 'QueryFinish'
    AND result_rows == 2
LIMIT 1;

-- check text index was created
SELECT
    name,
    type
FROM `system`.data_skipping_indices
WHERE table == 'tab'
    AND database = currentDatabase()
LIMIT 1;

SELECT read_rows == 6
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab WHERE s LIKE ''%01%'' ORDER BY k;')
    AND type = 'QueryFinish'
    AND result_rows == 3
LIMIT 1;

-- search text index
SELECT *
FROM tab
WHERE like(s, '%你好%')
ORDER BY k ASC;

SELECT read_rows == 2
FROM `system`.query_log
WHERE query_kind = 'Select'
    AND current_database = currentDatabase()
    AND endsWith(trimRight(query), 'SELECT * FROM tab WHERE s LIKE ''%你好%'' ORDER BY k;')
    AND type = 'QueryFinish'
    AND result_rows == 1
LIMIT 1;

-- search text index
SELECT *
FROM tab
WHERE like(s, '%house你好%')
ORDER BY k ASC;