create table test_table (A Nullable(String), B Nullable(String)) engine MergeTree order by (A,B) settings index_granularity = 1, allow_nullable_key=1;
select * from test_table where B is null;
CREATE TABLE dm_metric_small2 (`x` Nullable(Int64), `y` Nullable(Int64), `z` Nullable(Int64)) ENGINE = MergeTree() ORDER BY (x, y, z) SETTINGS index_granularity = 1, allow_nullable_key = 1;
SELECT * FROM dm_metric_small2 WHERE (x = 1) AND (y = 1) AND z IS NULL;
