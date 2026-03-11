-- { echo }
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data, key in (select key from data order by key limit 10));
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data, key in (select key from data order by key desc limit 10));
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data, key in keys_1);
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data, key in keys_2);
