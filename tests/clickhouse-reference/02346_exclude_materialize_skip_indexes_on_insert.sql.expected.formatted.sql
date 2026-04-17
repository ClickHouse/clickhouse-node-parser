-- add_minmax_index_for_numeric_columns=0: Changes the plan and rows read
SET parallel_replicas_local_plan = 1; -- this setting may skip index analysis when false

SET use_skip_indexes_on_data_read = 0;

SET mutations_sync = 2; -- disable asynchronous mutations

CREATE TABLE tab
(
    a UInt64,
    b UInt64,
    INDEX idx_a a TYPE minmax,
    INDEX `id,x_b` b TYPE set(3)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 4, add_minmax_index_for_numeric_columns = 0;

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100)
SETTINGS exclude_materialize_skip_indexes_on_insert = '!@#$^#$&#$$%$,,.,3.45,45.'; -- { serverError CANNOT_PARSE_TEXT }

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

SET exclude_materialize_skip_indexes_on_insert = 'idx_a';

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100);

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100, 100);

SELECT *
FROM explain_indexes;

TRUNCATE TABLE tab;

ALTER TABLE tab MATERIALIZE INDEX idx_a;

ALTER TABLE tab MATERIALIZE INDEX `id,x_b`;

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100)
SETTINGS exclude_materialize_skip_indexes_on_insert = '`id,x_b`';

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100, 100)
SETTINGS exclude_materialize_skip_indexes_on_insert = '`id,x_b`';

SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO tab SELECT%')
    AND type = 'QueryFinish';

SET exclude_materialize_skip_indexes_on_insert = 'idx_a, `id,x_b`';

DROP TABLE tab;

DROP VIEW explain_indexes;