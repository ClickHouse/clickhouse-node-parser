SELECT _part
FROM mt
ORDER BY tupleElement(mergeTreePartInfo(_part), 'max_block') DESC;

SELECT
    _part,
    isMergeTreePartCoveredBy(_part, 'all_1_2_10')
FROM mt
ORDER BY tupleElement(mergeTreePartInfo(_part), 'max_block') DESC;