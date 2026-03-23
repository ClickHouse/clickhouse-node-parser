SET enable_analyzer = 1;
CREATE TABLE mt(key UInt64, value String)
ENGINE = MergeTree
ORDER BY key;
INSERT INTO mt SELECT rand(), rand() FROM numbers(4) SETTINGS min_insert_block_size_rows=1, max_block_size=1;
SELECT _part FROM mt ORDER BY mergeTreePartInfo(_part).max_block DESC;
SELECT _part, isMergeTreePartCoveredBy(_part, 'all_1_2_10') FROM mt ORDER BY mergeTreePartInfo(_part).max_block DESC;
