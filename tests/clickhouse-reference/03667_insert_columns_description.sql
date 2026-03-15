SELECT '-- remote table function columns description';
CREATE TABLE t0 (c Int DEFAULT 7) ENGINE = MergeTree() ORDER BY tuple();
SELECT * FROM t0 ORDER BY ALL;
CREATE TABLE fuzz_87972 (c0 Int MATERIALIZED 1, c1 Int EPHEMERAL) ENGINE = MergeTree() ORDER BY tuple();
SELECT * FROM file(database() || '_test.csv') ORDER BY ALL;
