-- { echoOn }
SYSTEM DROP  TABLE IF EXISTS t_implicit;

CREATE TABLE t_implicit
(
    a UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS add_minmax_index_for_numeric_columns = 1;

SELECT *
FROM `system`.data_skipping_indices
WHERE database = current_database()
    AND table = 't_implicit';

SYSTEM DROP  TABLE t_implicit;