select count() from test_03096;
select count() from test_03096 where b = 0;
select latest_fail_reason == '', is_done == 1 from system.mutations where table='test_03096' and database = currentDatabase();
