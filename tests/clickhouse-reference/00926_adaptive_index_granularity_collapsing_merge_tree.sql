SELECT COUNT(*) FROM zero_rows_per_granule;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM zero_rows_per_granule FINAL;
SELECT sum(marks) from system.parts WHERE table = 'zero_rows_per_granule' and database=currentDatabase() and active=1;
SELECT '-----';
SELECT COUNT(*) FROM four_rows_per_granule;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule' and database=currentDatabase() and active=1;
SELECT sum(marks) from system.parts WHERE table = 'four_rows_per_granule' and database=currentDatabase() and active=1;
