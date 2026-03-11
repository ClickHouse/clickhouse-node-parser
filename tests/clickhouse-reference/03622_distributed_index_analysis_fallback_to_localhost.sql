select count(), sum(marks) from system.parts where database = currentDatabase() and table = 'test_1m' and active;
-- { echo }
select count() from test_1m where key > 10000 settings distributed_index_analysis=0;
select count() from test_1m where key > 10000 settings distributed_index_analysis=1;
