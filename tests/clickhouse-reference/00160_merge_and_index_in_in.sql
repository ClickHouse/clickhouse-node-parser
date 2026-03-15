CREATE TABLE mt_00160 (d Date DEFAULT toDate('2015-05-01'), x UInt64) ENGINE = MergeTree PARTITION BY d ORDER BY x SETTINGS index_granularity = 1, min_bytes_for_wide_part = 0;
CREATE TABLE merge_00160 (d Date, x UInt64) ENGINE = Merge(currentDatabase(), '^mt_00160$');
SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;
SET max_block_size = 1000000;
SELECT *, b FROM mt_00160 WHERE x IN (12345, 67890) AND NOT ignore(blockSize() < 10 AS b) ORDER BY x;
SELECT *, b FROM merge_00160 WHERE x IN (12345, 67890) AND NOT ignore(blockSize() < 10 AS b) ORDER BY x;
CREATE TABLE mt_00160 (d Date DEFAULT toDate('2015-05-01'), x UInt64, y UInt64, z UInt64) ENGINE = MergeTree PARTITION BY d ORDER BY (x, z) SETTINGS index_granularity = 1, min_bytes_for_wide_part = 0;
SELECT *, b FROM mt_00160 WHERE (z, y, x) IN ((617, 1244, 1234), (2839, 5688, 5678), (1,1,1)) AND NOT ignore(blockSize() < 10 AS b) ORDER BY (x, y, z);
