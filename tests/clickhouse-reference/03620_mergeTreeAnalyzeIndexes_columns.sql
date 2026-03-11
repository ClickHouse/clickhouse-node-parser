-- { echo }
select part_name from mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);
select ranges from mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);
select arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges)) as ranges_size from mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);
select sum(arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges))) as ranges_size from mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);
