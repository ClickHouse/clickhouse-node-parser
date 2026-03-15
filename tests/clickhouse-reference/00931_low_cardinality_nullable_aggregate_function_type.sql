CREATE TABLE lc (`date` Date, `name` LowCardinality(Nullable(String)), `clicks` Nullable(Int32)) ENGINE = MergeTree() ORDER BY date SETTINGS index_granularity = 8192;
SELECT date, argMax(name, clicks) FROM lc GROUP BY date;
