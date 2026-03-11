SELECT Y.id - 1
FROM
    X
RIGHT JOIN Y
    ON (X.id + 1) = Y.id
SETTINGS join_use_nulls = 1;

SELECT Y.id - 1
FROM
    X
RIGHT JOIN Y
    ON (X.id + 1) = toInt64(Y.id)
SETTINGS join_use_nulls = 1;

SELECT 2 + 1
FROM
    `system`.one AS X
RIGHT JOIN `system`.one AS Y
    ON X.dummy + 1 = Y.dummy
SETTINGS join_use_nulls = 1;

SELECT 2 + 1
FROM
    `system`.one AS X
RIGHT JOIN `system`.one AS Y
    ON X.dummy + 1 = toUInt16(Y.dummy)
SETTINGS join_use_nulls = 1;

SELECT X.dummy + 1
FROM
    `system`.one AS X
RIGHT JOIN `system`.one AS Y
    ON X.dummy = Y.dummy
SETTINGS join_use_nulls = 1;

SELECT Y.dummy + 1
FROM
    `system`.one AS X
RIGHT JOIN `system`.one AS Y
    ON X.dummy = Y.dummy
SETTINGS join_use_nulls = 1;