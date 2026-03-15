-- { echoOn }

CREATE TABLE t03324 (c0 Nullable(Int)) ENGINE = AggregatingMergeTree() PARTITION BY (c0) ORDER BY (c0) SETTINGS allow_nullable_key = 1;
SELECT c0 FROM t03324 FINAL ORDER BY c0 DESC SETTINGS extremes = 1;
