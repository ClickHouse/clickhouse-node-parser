-- Tags: no-random-merge-tree-settings

----- Group of very similar simple tests ------
select '----HORIZONTAL MERGE TESTS----';
SELECT COUNT(*) FROM zero_rows_per_granule;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM two_rows_per_granule;
SELECT distinct(marks) from system.parts WHERE table = 'two_rows_per_granule' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM four_rows_per_granule;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM huge_granularity_small_blocks;
SELECT distinct(marks) from system.parts WHERE table = 'huge_granularity_small_blocks' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM adaptive_granularity_alter;
SELECT distinct(marks) from system.parts WHERE table = 'adaptive_granularity_alter' and database=currentDatabase() and active=1;
SELECT k, v2 FROM adaptive_granularity_alter WHERE k >= 100 OR k = 42 ORDER BY k;
SELECT sum(marks) from system.parts WHERE table = 'adaptive_granularity_alter' and database=currentDatabase() and active=1;
