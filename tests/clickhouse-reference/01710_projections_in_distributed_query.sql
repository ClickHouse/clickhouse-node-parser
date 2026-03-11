select toStartOfMinute(dt) dt_m, sum(cost) from projection_test group by dt_m;
select sum(cost) from projection_test;
select toStartOfMinute(dt) dt_m, sum(cost) from projection_test_d group by dt_m;
select sum(cost) from projection_test_d;
