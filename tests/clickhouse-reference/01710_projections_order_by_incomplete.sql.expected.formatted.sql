CREATE TABLE data_proj_order_by_incomp
(
    t UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

-- { echoOn }
SELECT t
FROM data_proj_order_by_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 1;

SELECT t
FROM data_proj_order_by_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 0;

SELECT t
FROM data_proj_order_by_incomp
WHERE t > 0
ORDER BY t ASC
SETTINGS max_threads = 1;