select count(), sum(marks) from system.parts where database = currentDatabase() and table = 'test_1m' and active;
-- { echo }
select count() from (select * from test_1m);
