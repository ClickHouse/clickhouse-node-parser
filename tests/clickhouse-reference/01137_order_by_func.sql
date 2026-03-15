CREATE TABLE pk_func(d DateTime, ui UInt32) ENGINE = MergeTree ORDER BY toDate(d) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SELECT * FROM pk_func ORDER BY toDate(d), ui LIMIT 5;
CREATE TABLE nORX (`A` Int64, `B` Int64, `V` Int64) ENGINE = MergeTree ORDER BY (A, negate(B)) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SELECT *
FROM nORX
WHERE B >= 1000
ORDER BY
    A ASC,
    -B ASC
LIMIT 3
SETTINGS max_threads = 1;
