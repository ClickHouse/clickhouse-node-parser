SELECT t
FROM data_order_by_proj_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 1;

SELECT t
FROM data_order_by_proj_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 0;

SELECT t
FROM data_order_by_proj_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS max_threads = 1;