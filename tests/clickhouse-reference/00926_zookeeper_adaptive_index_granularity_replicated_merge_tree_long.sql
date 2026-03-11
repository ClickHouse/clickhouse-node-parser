-- Tags: long, replica, no-random-merge-tree-settings

----- Group of very similar simple tests ------
select '----HORIZONTAL MERGE TESTS----';
SELECT COUNT(*) FROM zero_rows_per_granule1;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM zero_rows_per_granule2;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule2' and database=currentDatabase() and active=1;
SELECT sleep(0.7) Format Null;
SELECT COUNT(*) FROM four_rows_per_granule1;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM four_rows_per_granule2;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule2' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM adaptive_granularity_alter1;
SELECT distinct(marks) from system.parts WHERE table = 'adaptive_granularity_alter1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM adaptive_granularity_alter2;
SELECT distinct(marks) from system.parts WHERE table = 'adaptive_granularity_alter2' and database=currentDatabase() and active=1;
SELECT k, v2 FROM adaptive_granularity_alter1 WHERE k >= 100 OR k = 42 ORDER BY k;
SELECT sum(marks) from system.parts WHERE table = 'adaptive_granularity_alter1' and database=currentDatabase() and active=1;
SELECT k, v2 FROM adaptive_granularity_alter2 WHERE k >= 100 OR k = 42 ORDER BY k;
SELECT sum(marks) from system.parts WHERE table = 'adaptive_granularity_alter2' and database=currentDatabase() and active=1;
