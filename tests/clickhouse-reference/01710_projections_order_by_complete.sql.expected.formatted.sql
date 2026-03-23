CREATE TABLE data_proj_order_by_comp
(
    t UInt64,
    PROJECTION tSort (    SELECT *
    ORDER BY t ASC)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO data_proj_order_by_comp;

INSERT INTO data_proj_order_by_comp;

-- { echoOn }
SELECT t
FROM data_proj_order_by_comp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 1;

SELECT t
FROM data_proj_order_by_comp
WHERE t > 0
ORDER BY t ASC
SETTINGS optimize_read_in_order = 0;

SELECT t
FROM data_proj_order_by_comp
WHERE t > 0
ORDER BY t ASC
SETTINGS max_threads = 1;