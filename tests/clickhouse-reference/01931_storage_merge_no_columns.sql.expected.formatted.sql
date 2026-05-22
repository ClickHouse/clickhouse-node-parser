DROP TABLE IF EXISTS data;

CREATE TABLE data
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

SELECT 1
FROM merge(currentDatabase(), '^data$')
PREWHERE _table IN (NULL); -- { serverError ILLEGAL_PREWHERE }

SELECT 1
FROM merge(currentDatabase(), '^data$')
WHERE _table IN (NULL);

DROP TABLE data;