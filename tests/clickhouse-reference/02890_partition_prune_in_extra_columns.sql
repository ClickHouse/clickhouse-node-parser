CREATE TABLE e (dt DateTime, t Int32) ENGINE = MergeTree() PARTITION BY (t, toYYYYMM(dt)) ORDER BY tuple();
SELECT COUNT(*) FROM e WHERE (t, dt) IN (86, '2022-12-12 11:00:00');
