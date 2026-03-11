SELECT id
FROM tab1 FINAL
WHERE v = 0;

SELECT id
FROM tab1 FINAL
WHERE v = 9;

SELECT id
FROM tab1 FINAL
WHERE v = 1;

SELECT id
FROM tab1 FINAL
WHERE v = 2;

SELECT id
FROM tab1 FINAL
WHERE v = 3;

SELECT id
FROM tab1 FINAL
WHERE v = 4;

SELECT id
FROM tab1 FINAL
WHERE v = 5;

SELECT id
FROM tab1 FINAL
WHERE v = 6;

SELECT id
FROM tab1 FINAL
WHERE v = 7;

SELECT id
FROM tab1 FINAL
WHERE v = 8;

SELECT id
FROM tab1 FINAL
WHERE v = 8888;

SELECT id
FROM tab1 FINAL
WHERE v = 9999;

SELECT
    id1,
    id2,
    id3
FROM tab2 FINAL
WHERE v = rand() % 10000;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 1
SETTINGS max_rows_to_read = 1;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 0
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 1
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 2
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 3
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 4
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 5
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 6
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 7
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 8
SETTINGS max_rows_to_read = 2;

SELECT
    key,
    value
FROM tab3 FINAL
WHERE value = 9
SETTINGS max_rows_to_read = 2;