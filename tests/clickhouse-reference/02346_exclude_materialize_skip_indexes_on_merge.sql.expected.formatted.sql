-- add_minmax_index_for_numeric_columns=0: Different plan (extra filtering)
SET parallel_replicas_local_plan = 1; -- this setting may skip index analysis when false

SET use_skip_indexes_on_data_read = 0;

SET materialize_skip_indexes_on_insert = 0;

SET mutations_sync = 2; -- disable asynchronous mutations

DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    a UInt64,
    b UInt64,
    INDEX idx_a a TYPE minmax,
    INDEX `id,x_b` b TYPE set(3)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 4, materialize_skip_indexes_on_merge = 1, add_minmax_index_for_numeric_columns = 0;

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100);

CREATE VIEW explain_indexes
AS
SELECT trimLeft(`explain`) AS `explain`
FROM (
        SELECT *
        FROM viewExplain('EXPLAIN', 'indexes = 1', (
                SELECT count()
                FROM tab
                WHERE (a >= 90)
                    AND (a < 110)
                    AND (b = 2)
            ))
    )
WHERE (like(`explain`, '%Name%'))
    OR (like(`explain`, '%Description%'))
    OR (like(`explain`, '%Parts%'))
    OR (like(`explain`, '%Granules%'))
    OR (like(`explain`, '%Range%'));

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100, 100);

SELECT *
FROM explain_indexes;

DROP TABLE tab;

DROP VIEW explain_indexes;