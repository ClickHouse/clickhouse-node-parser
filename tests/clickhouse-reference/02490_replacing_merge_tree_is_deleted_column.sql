select * from test FINAL order by uid;
select * from test order by uid;
-- d6 has to be removed since we set clean_deleted_rows as 'Always'
select * from test where is_deleted=0 order by uid;
SELECT * FROM testCleanupR1 order by uid;
SELECT * FROM testSettingsR1 where is_deleted=0 order by col1;
select 'no cleanup 1', * from test FINAL order by uid;
select 'no cleanup 2', * from test order by uid;
select 'no cleanup 3', * from test FINAL order by uid;
select 'no cleanup 4', * from test order by uid;
SELECT * FROM testMT order by uid;
SELECT * FROM testSummingMT order by uid;
SELECT * FROM testAggregatingMT order by uid;
SELECT * FROM testCollapsingMT order by uid;
SELECT * FROM testVersionedCMT order by uid;
