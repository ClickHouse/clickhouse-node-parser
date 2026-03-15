SET enable_analyzer = 1;
CREATE TABLE mt(key UInt64, value String)
ENGINE = MergeTree
ORDER BY key;
SELECT _part FROM mt ORDER BY mergeTreePartInfo(_part).max_block DESC;
SELECT _part, isMergeTreePartCoveredBy(_part, 'all_1_2_10') FROM mt ORDER BY mergeTreePartInfo(_part).max_block DESC;
