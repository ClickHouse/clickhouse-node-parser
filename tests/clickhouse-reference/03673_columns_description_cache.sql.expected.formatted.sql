-- Cache is only for MergeTree
SYSTEM drop  table if exists t_mem;

CREATE TABLE t_mem
(
    key Int
)
ENGINE = Memory();

INSERT INTO t_mem;

SELECT columns_descriptions_cache_size
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't_mem';

-- MergeTree
SYSTEM drop  table if exists t_mt;

-- { echoOn }
CREATE TABLE t_mt
(
    key Int
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT columns_descriptions_cache_size
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't_mt';

INSERT INTO t_mt;

INSERT INTO t_mt;

INSERT INTO t_mt;

INSERT INTO t_mt;

-- system.metrics
SELECT value > 0
FROM `system`.metrics
WHERE metric = 'ColumnsDescriptionsCacheSize';