CREATE TABLE t (c0 Nullable(Int)) ENGINE = MergeTree() ORDER BY (c0) PARTITION BY (c0) SETTINGS allow_nullable_key = 1;
SELECT c0, _part FROM t ORDER BY ALL;
CREATE TABLE taggr (c0 Nullable(Int)) ENGINE = AggregatingMergeTree() ORDER BY (c0) PARTITION BY (c0) SETTINGS allow_nullable_key = 1;
SELECT c0, _part FROM taggr FINAL ORDER BY ALL;
