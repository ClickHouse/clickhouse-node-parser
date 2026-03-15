CREATE TABLE t_subcolumns_if
(
    id Nullable(Int64)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT sum(multiIf(isNotNull(id), 1, 0))
FROM t_subcolumns_if
SETTINGS
    enable_analyzer = 1,
    optimize_functions_to_subcolumns = 1;

SELECT sum(multiIf(isNull(id), 1, 0))
FROM t_subcolumns_if
SETTINGS
    enable_analyzer = 0,
    optimize_functions_to_subcolumns = 1;

SELECT sum(multiIf(isNull(id), 1, 0))
FROM t_subcolumns_if
SETTINGS
    enable_analyzer = 1,
    optimize_functions_to_subcolumns = 0;

SELECT sum(multiIf(isNull(id), 1, 0))
FROM t_subcolumns_if
SETTINGS
    enable_analyzer = 1,
    optimize_functions_to_subcolumns = 1;