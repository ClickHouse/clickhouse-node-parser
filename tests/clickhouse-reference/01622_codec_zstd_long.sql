CREATE TABLE words(i Int, word String) ENGINE = Memory;
CREATE TABLE zstd_1_00(n Int, b String CODEC(ZSTD(1))) ENGINE = MergeTree ORDER BY n;
CREATE TABLE zstd_1_24(n Int, b String CODEC(ZSTD(1,24))) ENGINE = MergeTree ORDER BY n;
CREATE TABLE zstd_9_00(n Int, b String CODEC(ZSTD(9))) ENGINE = MergeTree ORDER BY n;
CREATE TABLE zstd_9_24(n Int, b String CODEC(ZSTD(9,24))) ENGINE = MergeTree ORDER BY n;
SELECT COUNT(n) FROM zstd_1_00 LEFT JOIN words ON i == n WHERE b == word;
SELECT COUNT(n) FROM zstd_1_24 LEFT JOIN words ON i == n WHERE b == word;
SELECT COUNT(n) FROM zstd_9_00 LEFT JOIN words ON i == n WHERE b == word;
SELECT COUNT(n) FROM zstd_9_24 LEFT JOIN words ON i == n WHERE b == word;
