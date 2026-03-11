SELECT '-- Reproducer result:';

SELECT *
FROM `03164_users`
ORDER BY uid ASC
LIMIT 10
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 ASC,
    c2 ASC
SETTINGS optimize_read_in_order = 1;

SELECT
    c1,
    c2
FROM `03164_multi_key`
ORDER BY
    c1 DESC,
    c2 DESC
SETTINGS optimize_read_in_order = 1;