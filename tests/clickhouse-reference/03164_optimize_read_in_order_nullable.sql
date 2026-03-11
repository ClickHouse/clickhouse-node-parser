SELECT '-- Reproducer result:';
SELECT * FROM 03164_users ORDER BY uid ASC NULLS FIRST LIMIT 10 SETTINGS optimize_read_in_order = 1;
SELECT c1, c2
FROM 03164_multi_key
ORDER BY c1 ASC NULLS LAST, c2 ASC NULLS LAST
SETTINGS optimize_read_in_order = 1;
SELECT c1, c2
FROM 03164_multi_key
ORDER BY c1 ASC NULLS LAST, c2 ASC NULLS FIRST
SETTINGS optimize_read_in_order = 1;
SELECT c1, c2
FROM 03164_multi_key
ORDER BY c1 ASC NULLS FIRST, c2 ASC NULLS LAST
SETTINGS optimize_read_in_order = 1;
SELECT c1, c2
FROM 03164_multi_key
ORDER BY c1 DESC NULLS FIRST, c2 DESC NULLS LAST
SETTINGS optimize_read_in_order = 1;
