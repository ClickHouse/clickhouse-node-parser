SET enable_analyzer = 1;
CREATE TABLE t0 (c0 Nullable(Int)) ENGINE = MergeTree() PARTITION BY (c0) ORDER BY tuple() SETTINGS allow_nullable_key = 1;
SET optimize_functions_to_subcolumns = 0;
SELECT count() FROM t0 WHERE (t0.c0 IS NULL) = TRUE;
