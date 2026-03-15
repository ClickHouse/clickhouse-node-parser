CREATE TABLE 02481_mergetree(x UInt64, y UInt64, arr Array(String)) ENGINE = MergeTree ORDER BY x SAMPLE BY x SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
CREATE TABLE 02481_merge(x UInt64, y UInt64, arr Array(String)) ENGINE = Merge(currentDatabase(), '^(02481_mergetree)$');
SELECT count() FROM 02481_mergetree SAMPLE 1 / 2 ARRAY JOIN arr WHERE x != 0;
SELECT count() FROM 02481_merge SAMPLE 1 / 2 ARRAY JOIN arr WHERE x != 0;
